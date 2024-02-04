class AddForeignKeyToRecipeFoods < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recipe_foods, :recipes, on_delete: :cascade
  end
end
