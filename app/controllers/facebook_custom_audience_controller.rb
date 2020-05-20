class FacebookCustomAudienceController < ApplicationController
  include FacebookCustomAudienceHelper
  skip_before_action :verify_authenticity_token
  require 'rubygems' if RUBY_VERSION < '1.9'
  require 'rest_client'

  def send_data_to_autopilot
    if params[:bad_credit_customer].downcase == "yes"
      contact_lit = "contactlist_540914cc-5c2c-4971-a0f4-0faaa4913ce5"
    else
      contact_lit = "contactlist_2b0a5144-dedb-41f7-9088-5e621a197291"
    end

    values = {
      'contact': {
        'MailingPostalCode': params[:postcode],
        'FirstName': params[:firstname],
        'LastName': params[:lastname],
        'Email': params[:email],
        'Phone': params[:phone1],
        'LeadSource': params[:source],
        "_autopilot_list": contact_lit,
        'custom': {
          'string--bad_credit_customer':  params[:bad_credit_customer],
          'string--campaign':  params[:campaign],
          'string--adgroupid':  params[:adgroupid],
          'string--sid':  params[:sid],
          'string--ssid':  params[:ssid],
          'string--ad_set':  params[:ad_set],
          'string--c1':  params[:c1],
          'string--keyword':  params[:keyword],
          'string--trafficid':  params[:trafficid],
          'string--prize':  params[:prize],
          'string--ipaddress':  params[:ipaddress],
          'string--optinurl':  params[:optinurl],
          'string--optindate':  params[:optindate],
          'string--campaignkey':  params[:campaignkey],
        }
      }
    }

    headers = {
      :autopilotapikey => 'f745214713484590b194c550aaadb259',
      :content_type => 'application/json'
    }
    response = RestClient.post 'https://api2.autopilothq.com/v1/contact', values.to_json, headers
    puts response
  end


  def create
    send_data_to_autopilot
    # Test app credientails "Custom Audience - Test1"
    access_token = 'EAAMQHbZBRdBsBALaAQI1OdZCNEOLIa4yGOTk9I4isSC0iZARcwn5FZClkIJieLDPUnEYMgFy1It0j5BP151xiTz7gXh1uKGiWq1YXYjLnru4ZBU5rOsRZBqH5uteBkZAK9T2xqg6h5vRs1kUMBIFlT7JocYdmR0QZANSsZCP2NHbXeawdjfreRtTg'
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
