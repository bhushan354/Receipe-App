Rails.application.routes.draw do
  devise_for :users

  root 'foods#index'

  resources :foods, except: [:update]
  resources :recipes do
    member do
      patch 'toggle_public'
    end
    resources :recipe_foods
  end

  get 'shopping_list' => 'shopping_lists#index', as: :shopping_list

  get 'public_recipes', to: 'recipes#public_recipes', as: :public_recipes

  get 'up', to: 'rails/health#show', as: :rails_health_check
end
