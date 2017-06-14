class CreateFoodItemSections < ActiveRecord::Migration[5.0]
  def change
    create_table :food_item_sections do |t|
      t.references :food_item, foreign_key: true
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
