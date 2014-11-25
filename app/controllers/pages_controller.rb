class PagesController < ApplicationController
	
  def home
  end

  def announcement
		@post = current_user.posts.build if logged_in?
		@announcements = Post.paginate(page: params[:page], :per_page => 10)
  end

  def all
		@listing = current_user.listings.build if logged_in?
		@product_items = Listing.paginate(page: params[:page], :per_page => 20)
  end

  def service
  end
	
	

end
