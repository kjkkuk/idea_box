# frozen_string_literal: true

class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_idea, only: [:edit, :update]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
    special_users = TeamMember.where(is_creator: true, users_id: current_user.id).map do |p|
      [p.team.team_name,
       p.team.id]
    end
    @team_of_user = special_users.insert(0, ['none', nil])
  end

  def show
    @idea = Idea.find(params[:id])
    authorize @idea
  end

  def edit; end

  def update
    if @idea.update(idea_params)
      redirect_to action: :index
      flash[:notice] = 'Update idea!'
    else
      errors_messages
      render :edit
    end
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    if @idea.save
      redirect_to @idea
      flash[:notice] = "The #{@idea.idea_name} is created!"
    else
      errors_messages
      render :new
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    authorize @idea
    if @idea.destroy
      redirect_to @idea
      flash[:notice] = "The #{@idea.idea_name} is deleted!"
    else
      errors_messages
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:idea_name, :idea_description, :need, :problem, :geo, :industry, :visible, :teams_id)
  end

  def errors_messages
    flash[:error] = @idea.errors.full_messages
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
