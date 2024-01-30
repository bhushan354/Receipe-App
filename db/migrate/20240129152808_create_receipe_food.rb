class CreateReceipeFood < ActiveRecord::Migration[7.1]
  def change
    create_table :receipe_foods do |t|
      t.integer :quantity
      t.references :recipe, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
