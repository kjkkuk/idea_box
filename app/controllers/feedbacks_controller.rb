# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :find_idea
  before_action :find_feedback, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.ideas_id = @idea.id
    @feedback.users_id = current_user.id
    if @feedback.save
      redirect_to idea_path(@idea)
    else
      render 'new'
    end
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to idea_path(@idea)
    else
      render 'edit'
    end
  end

  def edit
    # edit
  end

  def destroy
    @feedback.destroy
    redirect_to idea_path(@idea)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rating, :reaction)
  end

  def find_idea
    @idea = Idea.find(params[:idea_id])
  end

  def find_feedback
    @feedback = Feedback.find(params[:id])
  end
end
