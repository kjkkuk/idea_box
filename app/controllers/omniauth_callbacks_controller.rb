# frozen_string_literal: true

class OmniauthCallbacksController < ApplicationController
  def all
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.user_attributes'] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:notice] = I18n.t 'devise.omniauth_callbacks.failure'
    redirect_to new_user_registration_url
  end

  alias_method :linkedin, :all
  alias_method :github, :all
  alias_method :google_oauth2, :all
end
