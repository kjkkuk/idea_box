# frozen_string_literal: true

# == Route Map
#
#
Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'public#index'

  resources :teams do
    # resources :comments
    # resources :ratings
    # resources :viewings, only: %i[create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
