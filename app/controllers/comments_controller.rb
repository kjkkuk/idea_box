# frozen_string_literal: true

class CommentsController < ApplicationController
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
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = 'Comment successfully added'
      redirect_to comments_path(@comment)
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
