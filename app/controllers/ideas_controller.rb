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

  # def do
  #   if (params[:exp] = '1') #remember that params come back as strings
  #     do_something
  #   elsif (params[:exp] = '2')
  #     do_something_else
  #   else
  #     handle_the_no_default_radio_button_case # if you want one to be checked, supply true as the third parameter
  #   end
  #
  #   respond_to do |format|
  #     format.js {
  #       render :update do |page|
  #         page.replace_html #or some other reponse
  #       end
  #     }
  #   end
  # end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    @idea.visible = true
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
    @idea.destroy
    redirect_to teams_path(@idea)
  end

  private

  def idea_params
    params.require(:idea).permit(:idea_name, :idea_description, :need, :problem, :geo, :industry, :visible, :teams_id)
  end

  def errors_messages
    flash[:error] = @idea.errors.full_messages
  end
end
