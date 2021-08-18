# frozen_string_literal: true

# == Route Map
#
#
Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'public#index'

  resources :users, only: [:index, :show, :edit, :update] do
    # resources :activities, only: [:index]
    # resources :subscriptions, only: %i[index new create destroy]
  end

  resources :teams do
    # resources
  end

  # resources :tags, only: [:show]
  # resources :categories, only: [:show]
  # resources :rss, only: [:index], format: 'rss'
  # resources :rss_feeds, only: %i[index show new create destroy]
  # resources :reports, only: %i[new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
