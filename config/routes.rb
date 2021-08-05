# frozen_string_literal: true

# == Route Map
#
# root to: "home#index"

Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  #redirect_uri=http://c4ab5b4740bc.ngrok.io/users/auth/google_oauth2/callback

  root to: 'public#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
