class FacebookCustomAudienceController < ApplicationController
  include FacebookCustomAudienceHelper
  
  def create
    # Test app credientails "Custom Audience - Test1"
    access_token = 'EAAMQHbZBRdBsBAOjWhpFtyx2bDLCllaV0JvuJm5zRIZCb39wnQGZBLbcaG0jcXwQw0K7FV7YNaJZCKHDPQdDTeTUpfaNjbacmEOwfx2poxU80JONksnRaZA71ZBoK45OfpX2PXUg0nq9fXt47zmrxPzwiGZBVKaQuhI4iNeAL8kDQZDZD'
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

    uri = URI("https://graph.facebook.com/v6.0/#{audience_id}/users")
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
