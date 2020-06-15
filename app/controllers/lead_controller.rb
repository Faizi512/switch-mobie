class LeadController < ApplicationController
  skip_before_action :verify_authenticity_token
  def fetch_redirect_url
    lead = Lead.find_by(lead_id: params[:id])
    if lead.present?
      lead.delete
      render json: {status: 200, url: lead.redirect_url}
    else
      render json: {status: 400}
    end
  end

  def redirect_webhook
    if params[:records]
      params[:records].each do |record|
        decide_url(record)
        lead = record[:lead][:id]
        Lead.create(lead_id: lead, redirect_url: @redirect_url)
      end
      render json: {status: 200}
    else
      render json: {status: 400}
    end
  end

  def mmd_exit_lead
    url = "https://dukeleads.leadbyte.co.uk/api/submit.php?returnjson=yes&campid=MMDEXIT&sid=1&phone1=#{params[:phone1]}&bc=#{params[:bc]}"
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url, {'Content-Type' => 'application/json'})
    response = http.request(request)
    puts "****" * 30
    puts JSON.parse(response.body)
    puts "****" * 30
    render json: {status: 200, response: JSON.parse(response.body)}
  end

  private
    def decide_url record
      campaign = record[:deliveries][0][:reference]
      case campaign # a_variable is the variable we want to compare
      when "Exit 1 (Energy)"
        @redirect_url = "/sp-exit?exit=1"
      when "Exit 2 (Credit)"
        @redirect_url = "/credit-report?exit=1"
      else
        @redirect_url = "https://mtrk5.co.uk/?a=14118&c=33110"
      end
    end
end