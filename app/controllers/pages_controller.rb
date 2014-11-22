class PagesController < ApplicationController
	
  def home
  end

  def announcement
		@post = current_user.posts.build if logged_in?
		@announcements = Post.paginate(page: params[:page])
  end

  def all
		@listing = current_user.listings.build if logged_in?
		@product_items = Listing.paginate(page: params[:page])
  end

  def service
  end
	

end
