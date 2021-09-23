# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.new(comment_params)
    @comment.users_id = current_user.id
    if @comment.save
      redirect_to idea_path(@idea)
      flash[:notice] = 'The comment is created!'
    else
      redirect_to @idea
      flash[:notice] = 'The comment is not created!'
    end
  end

  def destroy
    @comment = Comment.find(params[:idea_id])
    authorize @comment
    @comment.destroy
    flash[:notice] = 'Comment was successfully destroyed!'
    redirect_to idea_path(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commentable_type, :commentable_id)
  end
end
