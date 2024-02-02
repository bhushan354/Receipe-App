class RecipesController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_recipe, only: %i[destroy show toggle_public]

  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = @user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfuy'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    
    @recipe.recipe_foods.destroy_all

    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was successfully destroyed.'
    else
      redirect_to recipes_path, alert: 'Failed to destroy recipe.'
    end
  end

  def show
    @recipe_foods = @recipe.recipe_foods
  end

  def toggle_public
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe, notice: 'Recipe updated successfully.'
  end

  def public_recipes
    @recipes = Recipe.where(public: true).order(id: :desc)
  end

  private

  def set_user
    @user = current_user
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
