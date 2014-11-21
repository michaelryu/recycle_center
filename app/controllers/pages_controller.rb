class PagesController < ApplicationController
	
  def home
  end

  def help
  end

  def all
		@listing = current_user.listings.build if logged_in?
		@product_items = Listing.paginate(page: params[:page])
  end

  def service
  end
	
	def question
	end
	
end
