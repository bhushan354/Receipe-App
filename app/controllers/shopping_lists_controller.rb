class ShoppingListsController < ApplicationController
    def index
      @foods = current_user.foods
  
      current_user.recipes.map do |recipe|
        recipe.recipe_foods.includes(:food).map do |recipe_food|
          food = recipe_food.food
          selected_food = @foods.select { |f| f.name == food.name }[0]
          selected_food.quantity = selected_food.quantity - recipe_food.quantity
        end
      end
  
      @foods = @foods.select { |food| food.quantity.negative? }
  
      @foods.each { |food| food.quantity *= -1 }
  
      @total = 0
      @foods.each do |food|
        @total += (food.price * food.quantity)
      end
    end
end