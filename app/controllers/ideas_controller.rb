# frozen_string_literal: true

class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_idea, only: [:edit, :update]

  def index
    @ideas = Idea.order(created_at: :desc)
  end

  def new
    @idea = Idea.new
    special_users = TeamMember.where(is_creator: true, users_id: current_user.id).map do |team_member|
      [team_member.team.team_name,
       team_member.team.id]
    end
    @possible_teams = special_users.insert(0, ['none', nil])
  end

  def show
    @idea = Idea.find(params[:id])
    authorize @idea
    impressionist(@idea)
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
      redirect_to action: :index
      errors_messages
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

  def like
    @idea = Idea.find(params[:id])
    if current_user.voted_up_on? @idea
      @idea.downvote_by current_user
    elsif current_user.voted_down_on? @idea
      @idea.upvote_by current_user
      # else # not voted
      #   @idea.upvote_by current_user
    end
    respond_to do |format|
      format.js
    end
  end

  def search
    return if query.blank?

    @posts = Post.our_first_query(query)
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
