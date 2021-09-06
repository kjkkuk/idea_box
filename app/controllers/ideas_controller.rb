# frozen_string_literal: true

class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_team, only: [:edit, :update]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
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
    # @team.team_members << TeamMember.new(users_id: current_user.id, is_creator: true, team: @team,
    #                                      team_role: params[:team][:team_role])
    @idea.user = current_user
    if @idea.save
      redirect_to @idea
      flash[:notice] = "The #{@idea.idea_name} is created!"
    else
      errors_messages
      render :new
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:idea_name, :idea_description, :need, :problem, :geo, :industry)
  end

  def errors_messages
    flash[:error] = @idea.errors.full_messages
  end
end
