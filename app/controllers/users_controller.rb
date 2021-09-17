# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :validate_authorization_for_user, only: [:edit, :update]

  # GET /users/1
  def index
    @users = User.order(created_at: :desc)
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
    @user.sponsor ||= Sponsor.new
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      destroy_sponsor_profile if profile_should_destroy?
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private

  def destroy_sponsor_profile
    @user.sponsor.destroy!
  end

  def profile_should_destroy?
    !user_params[:sponsor_profile_exists] && @user.sponsor_id
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def validate_authorization_for_user
    redirect_to root_path unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :role_id,
                                 :sponsor_profile_exists,
                                 :password,
                                 sponsor_attributes: [:industry,
                                                      :geo,
                                                      :opportunity,
                                                      :id])
  end
end
