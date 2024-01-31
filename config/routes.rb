# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  get 'up' => 'rails/health#show', as: :rails_health_check


  resources :foods,  only: %i[index show new create destroy]
  resources :recipes, only: %i[index show new create destroy]
  # Defines the root path route ("/")
  root "foods#index"
  # root "posts#index"
end
