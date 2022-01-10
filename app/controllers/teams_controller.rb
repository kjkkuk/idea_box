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

  def add_member
    @team = Team.find(params[:id])
    render :add_member
    @team.team_members << TeamMember.new(users_id: id, is_creator: false, team: @team,
                                         team_role: params[:team][:team_role])
    redirect_to @team
  end

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

  private

  def team_params
    params.require(:team).permit(:team_name)
  end

 # def member_params
  #  params.require(:team).permit(:teams_id, :team_role, :users_id)
  # end<<<<<<< rating
65
 


  def errors_messages
    flash[:error] = @team.errors.full_messages
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def period
    @team.versions.each do |version|
      version.object['team_members_count']
      version.created_at.strftime('%Y-%m-%d')
    end
  end
end
