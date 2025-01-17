class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		if logged_in? && current_user.admin?
			@user = User.find(params[:id])
			@listings = @user.listings.paginate(page: params[:page])
			redirect_to root_url
		else
			redirect_to root_url
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_url
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password,
																 :password_confirmation)
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end

end
