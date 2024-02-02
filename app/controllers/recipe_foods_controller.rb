class RecipeFoodsController < ApplicationController
    def new
        # @recipe_food = RecipeFood.find(params[:recipe_id])
        @recipe_food = RecipeFood.new
    end
  
    def create
        @recipe_food = RecipeFood.new(recipe_food_params)
        @recipe_food.recipe_id = params[:recipe_id]
        if @recipe_food.save
        redirect_to recipe_path(params[:recipe_id]), notice: 'Food ingredient was successfully added.'
        else
        render :new
        end
    end
  
    def destroy
      @recipe_food = RecipeFood.find(params[:recipe_id])
      @recipe = @recipe_food.recipe
      if @recipe_food.destroy
        redirect_to recipes_path, notice: 'Recipe food successfully deleted.'
      else
        redirect_to recipe_path(@recipe), alert: 'Recipe food not deleted.'
      end
    end
  
    def edit
      @user = current_user
      @recipe_food = RecipeFood.find(params[:id])
      @recipe = @recipe_food.recipe
      @foods = Food.all
    end
  
    def update
      @recipe_food = RecipeFood.find(params[:id])
      @recipe = @recipe_food.recipe
      if @recipe_food.update(recipe_food_params)
        redirect_to recipe_path(@recipe), notice: 'Recipe food successfully updated.'
      else
        redirect_to request.referrer, alert: 'Recipe food not updated.'
      end
    end
  
    private
  
    def recipe_food_params
      params.require(:recipe_food).permit(:recipe_id,:quantity, :food_id)
    end
end