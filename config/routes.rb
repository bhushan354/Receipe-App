# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  get 'up' => 'rails/health#show', as: :rails_health_check

  # GET request to the '/public_recipes' path should be directed to the 'public_recipes' action in the 'recipes' controller
  get '/public_recipes', to: 'recipes#show_public_recipes', as: :public_recipes_path

  resources :foods,  only: %i[index show new create destroy]
  resources :recipes, only: %i[index show new create destroy]
  # Defines the root path route ("/")
  root "foods#index"
  # root "posts#index"
end
