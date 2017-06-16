class AddImageToFoodItems < ActiveRecord::Migration[5.0]
  def change
    add_column :food_items, :img_url, :string
  end
end
