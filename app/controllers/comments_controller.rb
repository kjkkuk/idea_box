# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @idea = Idea.find(params[:ideas_id])
    CreateCommentsService.call(comment_params, current_user, @article)
    redirect_to idea_path(@idea)
  end

  def destroy
    @idea = Idea.find(params[:ideas_id])
    DestroyCommentsService.call(comment_params, current_user, @article)
    redirect_to idea_path(@idea)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
