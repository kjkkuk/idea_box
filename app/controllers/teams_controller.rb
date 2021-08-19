# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_team, only: [:edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
    authorize @team
  end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to action: :index
      flash[:notice] = 'Update team!'
    else
      errors_messages
      render :edit
    end
  end

  def create
    @team = Team.new(team_params)
    @team.team_members << TeamMember.new(users_id: current_user.id, is_creator: true, team: @team,
                                         team_role: params[:team][:team_role])
    if @team.save
      redirect_to @team
      flash[:notice] = "The #{@team.team_name} is created!"
    else
      errors_messages
      render :new
    end
  end

  def destroy
    @team = Team.find(params[:id])
    authorize @team
    @team.destroy
    redirect_to teams_path(@team)
  end

  def team_params
    params.permit(:team_name)
  end

  def errors_messages
    flash[:error] = @team.errors.full_messages
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
