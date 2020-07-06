class FacebookCustomAudienceController < ApplicationController
  include FacebookCustomAudienceHelper
  skip_before_action :verify_authenticity_token
  require 'rubygems' if RUBY_VERSION < '1.9'
  require 'rest_client'


  def create
    # Test app credientails "Custom Audience - Test1"
    access_token = 'EAAMQHbZBRdBsBAJ2gECk16KMiTipR0xzZCFT36IApBBJEsxaxLGvNkArWVnt0uxeuZBAHgqrPZAnNZAziJuOH2BCtYZB1sXvZAUMPLxdKkCPD3jJmzuDZBmgx6j1rTVYqbZA8mZArTpZA8JT1P1qit1pJk7iyH9v7JXOFuam8IbGwsMfY29L69dMV2q'
    app_secret = 'd1308ffbfcf0b3f21425fa5ed1c22e5c'
    app_id = '862144884208667'
    id = 'act_611454116359143'
    audience_id = '23844386746780658'

    phone_num = "+44" + params[:phone1].split('').last(10).join

    payload = {
      schema: [
        "EMAIL",
        "PHONE",
        "FN",
        "LN",
        "ZIP",

      ],
      data: [
        [
          hash_256(params[:email]),
          hash_256(phone_num),
          hash_256(params[:firstname]),
          hash_256(params[:lastname]),
          hash_256(params[:postcode]),
        ],
      ]
    }

    uri = URI("https://graph.facebook.com/v7.0/#{audience_id}/users")
    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.path)
    req.form_data = {
      'access_token' => access_token,
      'payload' => payload.to_json
    }
    res = http.request(req)
    puts "----" *50
    puts JSON.parse(res.body)
    puts "----" *50
    render json: {status: 200, response: JSON.parse(res.body)}
  end

end
