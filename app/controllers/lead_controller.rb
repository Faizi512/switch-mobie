class LeadController < ApplicationController
  skip_before_action :verify_authenticity_token
  def fetch_redirect_url
    lead = Lead.find_by(lead_id: params[:id])
    if lead.present?
      lead.delete
      render json: {status: 200, lead: lead}
    else
      render json: {status: 400}
    end
  end

  def redirect_webhook
    puts "---------------" * 30
    if params[:records]
      params[:records].each do |record|
        decide_url(record)
        lead = record[:lead][:id]
        Lead.create(lead_id: lead, redirect_url: @redirect_url, delivery_name: @delivery_name)
      end
      render json: {status: 200}
    else
      render json: {status: 400}
    end
  end

  def mmd_exit_lead
    url = "https://dukeleads.leadbyte.co.uk/api/submit.php"
    uri = URI(url)
    params[:returnjson] = "yes"
    data = params.as_json
    uri.query = URI.encode_www_form(data)
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
    puts "--****---" * 30
    puts res.body
    puts "---****----" * 30
    render json: {status: 200, response: JSON.parse(res.body)}
  end

  def mmd_lead
    url = "https://dukeleads.leadbyte.co.uk/api/submit.php"
    uri = URI(url)
    params[:returnjson] = "yes"
    data = params.as_json
    uri.query = URI.encode_www_form(data)

    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)

    puts "****" * 30
    puts res.body
    puts "****" * 30
    render json: {status: 200, response: JSON.parse(res.body)}
  end

  private
    def decide_url record
      campaign = record[:deliveries][0][:reference]
      @delivery_name = campaign
      case campaign # a_variable is the variable we want to compare
      when "Exit 1 (Energy)"
        @redirect_url = "/e-deals?check=1"
      when "Exit 2 (Credit)"
        @redirect_url = "/credit-report?check=1"
      when "Exit 4 (sweetmobile)"
        @redirect_url = "http://lcuktrack.go2cloud.org/aff_c?offer_id=1&aff_id=1000&aff_sub=exit"
      when "Exit 5 (UK Credit Ratings)"
        @redirect_url = "/uk-credit-ratings?check=1"
      when "Exit 6 - Awin"
        @redirect_url = "/rmktg-awin?check=1"
      when "Exit 5 - Sweet 2"
        @redirect_url = "/rmktg-sweet?check=1"
      when "Exit 8 (Energy / Awin)"
        @redirect_url = "/e-deals-awin?check=1"
      when "Exit Lotto"
        @redirect_url = "/lotto?check=1"
      when "(Energy / Voxi)"
        @redirect_url = "/e-deals-voxi?check=1"
      when "Voxi Exit"
        @redirect_url = "https://www.awin1.com/cread.php?awinmid=10951&awinaffid=652417&ued=https%3A%2F%2Fwww.voxi.co.uk%2Facquisition%2Fplans"
      when "(Energy / E2Save)"
        @redirect_url = "/e-deals-e2save?check=1"
      when "Exit 10 (E 2 Save)"
        @redirect_url = "https://www.awin1.com/cread.php?awinmid=422&awinaffid=652417&clickref=exit&ued=https%3A%2F%2Fwww.e2save.com%2F"
      when "Exit Sweet-Mobile"
        @redirect_url = "https://dl.reliatrk.com/?a=2&c=4"
      when "Exit e2save - cashback deals"
        @redirect_url = "https://www.awin1.com/cread.php?awinmid=422&awinaffid=652417&clickref=EXIT+chasback+deals&ued=https%3A%2F%2Fwww.e2save.com%2Fcontract%2Fcashback-deals"
      when "Exit e2save - pay monthly contract deals"
        @redirect_url = "https://www.awin1.com/cread.php?awinmid=422&awinaffid=652417&clickref=EXIT+pay+monthly+contract+deals&ued=https%3A%2F%2Fwww.e2save.com%2Fcontract"
      when "Exit VOXI Google"
        @redirect_url = "https://www.awin1.com/cread.php?awinmid=10951&awinaffid=652417&ued=https%3A%2F%2Fwww.voxi.co.uk%2Facquisition%2Fplans"
      else
        @redirect_url = "https://mtrk11.co.uk/?a=14118&c=33110"
      end
    end
end
