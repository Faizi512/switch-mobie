class PagesController < ApplicationController
  include PagesHelper
	def index
    @amp = true
    get_deals_data('home')
    @bc = isbadCustomer(params[:keyword]) || params[:bc] == "yes"
	end

  def isbadCustomer query
    if(query)
      keywords = ["credit", "accepted", "bad", "score", "sunshine",
                         "no credit", "free", "guaranteed", "gift", "win", "wining", "very",
                         "phone check", "check" , "no upfront", "cheap", "catalogues", "later",
                         "sun", "no deposit", "accepted"]
      query = query.downcase();
      keywords.each do |word|
        matchedIndex = query.in?(word);
        if (matchedIndex) 
          return true;
          break;
        end
      end
      return false
    end
  end

	def show
    get_deals_data( params[:page_name] )
    respond_to do |format|
      format.html {@partial = render_to_string partial: params[:page_name].to_s}
      format.js {}
    end
	end
end
