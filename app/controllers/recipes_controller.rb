class RecipesController < ApplicationController
  before_action :set_user, only: %i[index show new create]

  def index
    @recipes = @user.recipes
  end

  def show
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = @user.recipes.new
  end

  def create
    @recipe = @user.recipes.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:notice] = 'Recipe deleted.'
    else
      flash[:alert] = 'Error deleting recipe.'
    end

    redirect_to recipes_path
  end

  def show_public_recipes
    @recipes = Recipe.where(public: true).order(id: :desc)
  end

  private

  def set_user
    @user = current_user
  end

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :preparation_time, :description, :public)
  end
end
