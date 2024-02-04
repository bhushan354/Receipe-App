class RenameReceipeFoodsToRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    rename_table :receipe_foods, :recipe_foods
  end
end
