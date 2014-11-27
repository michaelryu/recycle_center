class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :new]
	before_action :correct_user,   only: :destroy

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to @post
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		@post = Post.find(params[:post_id])
		redirect_to @post
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :post_id, :user_id)
	end

	def correct_user
		unless current_user.admin?
			@comment = current_user.comments.find_by(id: params[:id])
			redirect_to root_url if @comment.nil?
		end
	end
end
