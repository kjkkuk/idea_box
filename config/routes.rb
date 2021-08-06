# frozen_string_literal: true

# == Route Map
#
# root to: "home#index"

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'public#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
