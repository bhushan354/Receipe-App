class RecipeFoodsController < ApplicationController
    before_action :set_recipe_food, only: [:destroy, :edit, :update]

    def new 
        @recipe_food = RecipeFood.new
    end

    def create
        @recipe_food = RecipeFood.new(recipe_food_params)
        @recipe_food.recipe_id = params[:recipe_id]

        if @recipe_food.save
            redirect_to recipe_path(params[:recipe_id]), notice: 'food ingredient added successfully'
        else
            render :new
        end
    end

    def destroy
        @recipe_food.destroy
        redirect_to recipe_path(params[:recipe_id]), notice: 'food intergridient deleted succesfully'
    end

    def edit
     
    end

    def update
        if @recipe_food.update(recipe_food_params)
            redirect_to recipe_path(params[:recipe_id]), notice: 'Food ingredient was successfully updated.'
        else
            render :edit
        end
    end

    private

    def recipe_food_params
        params.require(:recipe_food).permit(:food_id, :quantity)
    end

    def set_recipe_food
        @recipe_food = RecipeFood.find(params[:id])
    end
end