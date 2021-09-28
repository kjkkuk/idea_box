# frozen_string_literal: true

# == Route Map
#
#
Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'public#index'

  resources :users
  resources :teams
  resources :ideas do
    resources :comments
  end
  post '/ideas/:id/subscribe', to: 'subscribe_idea#subscribe', as: 'subscribe_idea'
  post '/ideas/:id/unsubscribe', to: 'subscribe_idea#unsubscribe', as: 'unsubscribe_idea'

  get 'layouts/footer/:page', to: 'pages#show', as: 'pages'

  resources :users, only: [:index] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end
end
