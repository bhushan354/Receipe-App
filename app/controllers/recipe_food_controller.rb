class RecipeFoodsController < ApplicationController
    before_action :set_recipe_food, only: [:destroy, :edit, :update]

    def new 
        @recipe_food = RecipeFood.new
    end

    def create
            
    end

    def destroy
        
    end

    def edit

    end

    private

    def set_recipe_food
        @recipe_food = RecipeFood.find(params[:id])
    end
end