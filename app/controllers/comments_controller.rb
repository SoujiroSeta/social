class CommentsController < ApplicationController
	before_filter :authenticate_user!, exect: [:index, :show]
	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def create
		@user = current_user
		@comment = @user.comments.build(params[:comment])
		@comment.save
		redirect_to question_path(@comment.commentable)
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(params[:comment])
			redirect_to comment_path(@comment)
		else
			render :edit
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to comments_path
	end

end