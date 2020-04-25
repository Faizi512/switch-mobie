class PagesController < ApplicationController
  include PagesHelper
	def index
    @amp = true
    get_deals_data('home')
    @bc = isbadCustomer(params[:keyword]) || params[:bc] == "yes"
	end

	def show
    get_deals_data( params[:page_name] )
    respond_to do |format|
      format.html {@partial = render_to_string partial: params[:page_name].to_s}
      format.js {}
    end
	end
end
