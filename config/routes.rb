# frozen_string_literal: true

# == Route Map
#
#
Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root to: 'public#index'
  get :search, controller: :public

  resources :users do
    member do
      delete 'delete_image/image_id', action: 'delete_image', as: 'delete_image'
    end
  end

  # resources :teams do
  #   member do
  #     post 'add_member', action: 'add_member', as: 'add_member'
  #   end
  # end

  resources :ideas do
    resources :comments
    resources :feedbacks
    member do
      patch 'like', to: 'ideas#like'
    end
  end
  post '/ideas/:id/subscribe', to: 'subscribe_idea#subscribe', as: 'subscribe_idea'
  post '/ideas/:id/unsubscribe', to: 'subscribe_idea#unsubscribe', as: 'unsubscribe_idea'

  get 'layouts/footer/:page', to: 'pages#show', as: 'pages'

  resources :users, only: [:index] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end
end
