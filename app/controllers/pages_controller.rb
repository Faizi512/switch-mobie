class PagesController < ApplicationController
  include PagesHelper
	def index
    @amp = true
    get_deals_data('home')
    @bc = isbadCustomer(params[:keyword]) || params[:bc] == "yes"
	end

  def homev1
    home_deals
  end

  def social
    social_page
  end

	def show
    get_deals_data( params[:page_name] )
    respond_to do |format|
      format.html {@partial = render_to_string partial: params[:page_name].to_s}
      format.js {}
    end
	end

  def data_share
    response.headers.except! 'X-Frame-Options'
    render layout: 'data_share'
  end

  def set_cookies
    @cookie_uuid =  cookies[:_msuuid_1fexuyzkduuouz] || "SS#{SecureRandom.uuid}"
    @randon_token =  SecureRandom.uuid
    cookies[:_msuuid_1fexuyzkduuouz] = {
      value: @cookie_uuid,
      expires: 1.year.from_now,
      secure: false,
      httponly: false,
    }
    Time.zone = ('GMT');

    @endDate = DateTime.current.seconds_until_end_of_day;
    @timerendDate = @endDate;
    cookies[:timerEndDate] = {
      value: @timerendDate,
      expires: 3.day.from_now,
      secure: false,
      httponly: false,
    }
  end
end
