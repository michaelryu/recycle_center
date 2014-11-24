class ListingsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :admin_user,     only: [:create, :destroy]
	
	def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to all_path
    else
			@feed_items = []
      redirect_to all_path
    end
  end

  def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
    redirect_to request.referrer || all_path
  end

  private

    def listing_params
      params.require(:listing).permit(:title, :realprice, :tag_list, :picture)
    end
end
