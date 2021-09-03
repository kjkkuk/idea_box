# frozen_string_literal: true

# == Route Map
#
#
Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'public#index'

  resources :users, only: [:index, :show, :edit, :update] do
    # resources :activities, only: [:index]
  end

  resources :teams do
    # resources :activities, only: [:index]
  end

  resources :ideas do
    # resources :activities, only: [:index]
  end
end
