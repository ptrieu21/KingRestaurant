class AddViewsToFoodItem < ActiveRecord::Migration[5.0]
  def change
    add_column :food_items, :views, :integer, default: 0
  end
end
