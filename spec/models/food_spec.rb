require 'rails_helper'

RSpec.describe Food, type: :model do
  # Create a User record
  let(:user) { User.create(name: 'Binod', email: 'binod@email.com', password: 'password') }

  it 'is valid with valid attributes' do
    food = Food.create(name: 'Apple', measurement_unit: 'grams', price: 1.0, user:, quantity: 100)
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(measurement_unit: 'grams', price: 0.5, user:)
    expect(food).not_to be_valid
  end

  it 'is not valid with a negative price' do
    food = Food.new(name: 'Apple', measurement_unit: 'grams', price: -0.5, user:)
    expect(food).not_to be_valid
  end
end
