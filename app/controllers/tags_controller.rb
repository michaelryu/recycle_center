class TagsController < ApplicationController
	before_action :logged_in_user, only: :index
	before_action :admin_user,     only: :index

	def index
		@tags = ActsAsTaggableOn::Tag.all
	end

	def show
		@tag =  ActsAsTaggableOn::Tag.find(params[:id])
		@listings = Listing.tagged_with(@tag.name).paginate(page: params[:page], :per_page => 15)
	end
end
