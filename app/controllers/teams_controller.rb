# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action #:authenticate_user!
  before_action #:set_team, only: %i[edit update destroy]

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

    if @team.save
      # current_user.create(team: @team)
      redirect_to @team
      flash[:notice] = "The #{@team.team_name} is created!"
    else
      errors_messages
      render :new
    end

  end

  def destroy
    # @movie = Team.new(movie_params)
    # if @movie.save
    #   current_user.collections.create(movie: @movie)
    #   redirect_to current_user
    #   flash[:notice] = "The #{@movie.name} is added to your collection!"
    # else
    #   errors_messages
    #   render :new
    # end
  end

  def team_params
    params.require(:team).permit(:team_name)
  # rescue StandardError # use to grab data from search results
  #   {
  #     # 'tmdb_id' => params['tmdb_id'],
  #     # 'name' => params['name'],
  #     # 'year' => params['year'],
  #     # 'description' => params['description'],
  #     # 'rating' => params['rating'],
  #     # 'poster_path' => params['poster_path']
  #   }
  end

  def rescue_with_movie_not_found
    render plain: 'Movie was not found', status: :not_found
  end

  def errors_messages
    flash[:error] = @team.errors.full_messages
  end

  def set_movie
    @team = Movie.find(params[:id])
  end
end
