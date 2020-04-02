class PagesController < ApplicationController
  include PagesHelper
	def index
    get_deals_data('home')
	end
  

	def show
    get_deals_data( params[:page_name] )
    respond_to do |format|
      format.html {@partial = render_to_string partial: params[:page_name].to_s}
      format.js {}
    end
	end
end
