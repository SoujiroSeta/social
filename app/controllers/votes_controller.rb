class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = Comment.find(params[:comment_id])
    @vote = @comment.votes.where(user_id: current_user.id).first
    if @vote.blank?
      @vote = @comment.votes.create(user_id: current_user.id, vote_status: 'LIKE')
    else
      @vote.update_attributes(vote_status: 'LIKE')
    end
    redirect_to question_path(@comment.commentable, notice: 'Vote was successfully created.')
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @vote = @comment.votes.where(user_id: current_user.id).first

    if @vote.blank?
      @vote = @comment.votes.create(user_id: current_user.id, vote_status: 'DISLIKE')
    else
      @vote.update_attributes(vote_status: 'DISLIKE')
    end
    redirect_to question_path(@comment.commentable)
  end
end
