require 'rails_helper'

RSpec.describe 'Recipe', type: :feature do
  before(:each) do
    @user = User.create(name: 'New User', email: 'new@example.com', password: 'secure_password')
    @recipe = Recipe.create(name: 'Special Pizza', preparation_time: 30, cooking_time: 20, description: 'The best pizza ever!',
                            public: true, user_id: @user.id)
    @food = Food.create(name: 'Tomatoes', measurement_unit: 'Kg', price: 2.5, quantity: 5, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 2, food_id: @food.id, recipe_id: @recipe.id)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'secure_password'
    click_button 'Log in'
  end

  describe 'Recipe validation on index page' do
    it 'displays Remove button for each recipe' do
      visit recipes_path
      expect(page).to have_content('Remove')
    end

    it 'displays Edit button for each recipe' do
      visit recipes_path
      expect(page).to have_content('Edit')
    end

    it 'displays recipe name' do
      visit recipes_path
      expect(page).to have_content('Special Pizza')
    end

    it 'indicates if a recipe is public' do
      visit recipes_path
      expect(page).to have_content('Public')
    end
  end
end
