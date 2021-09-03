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
    if @idea.update(team_params)
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
    # if @team.save
    #   redirect_to @team
    #   flash[:notice] = "The #{@team.team_name} is created!"
    # else
    #   errors_messages
    #   render :new
    # end
  end

  def idea_params
    params.permit(:idea_name)
  end
end
