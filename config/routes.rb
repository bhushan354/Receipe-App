# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  get 'up' => 'rails/health#show', as: :rails_health_check
  authenticated :user do
    root 'foods#index', as: :authenticated_root
  end

  unauthenticated :user do
    root 'home#index', as: :unauthenticated_root
  end

resources :foods, except: [:update]
  resources :recipes, only: %i[index show new create destroy]
  # Defines the root path route ("/")
  # root "recipes#index"
  # root "posts#index"
end
