class PostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :admin_user,     only: [:create, :destroy]
	
	def create
		@post = current_user.posts.build(post_params)
    if @post.save
      redirect_to announcement_path
    else
			@announcements = []
      redirect_to announcement_path
    end
	end
	
	def show
		@post = Post.find(params[:id])
	end
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
    redirect_to request.referrer || announcement_path
	end
	
	 private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
