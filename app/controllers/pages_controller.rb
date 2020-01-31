class PagesController < ApplicationController
  include PagesHelper
	def index
    @head_scripts = "layouts/head/home"
    get_deals_data	
	end

	def show
    get_deals_data
    @head_scripts = "layouts/head/#{params[:page_name]}"
    respond_to do |format|
      format.html {@partial = render_to_string partial: params[:page_name].to_s}
      format.js {}
    end
	end
end
