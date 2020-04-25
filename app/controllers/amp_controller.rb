class AmpController < ApplicationController
  include PagesHelper

  def index
    @bc = isbadCustomer(params[:keyword]) || params[:bc] == "yes"
    render :layout => false
  end

  def sim_deal_only
    render :layout => false

  end

end
