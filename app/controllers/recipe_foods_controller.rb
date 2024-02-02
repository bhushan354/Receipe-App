class RecipeFoodsController < ApplicationController
  before_action :find_recipe_food, only: %i[destroy edit update]

  def new
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
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id]), notice: 'Food ingredient was successfully eliminated.'
  end

  def edit; end

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

  def find_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end
end
