class FoodsController < ApplicationController
  def index
    # "has_many :foods" because of this is in model hence there is" current_user.foods"
    @foods = current_user.foods
  end

  def new
    @food = Food.new
    @user = current_user
  end

  def create
    # creating a new Food object associated with the current_user without saving it to the database immediately.
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path, notice: 'New Food created successfully'
    else
      render :new
    end
  end

  def destroy
    # when u access /foods/1, the 1 is the :id parameter.
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Your Food is Deleted successfully'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
