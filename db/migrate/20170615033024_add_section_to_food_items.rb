class AddSectionToFoodItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :food_items, :section, foreign_key: true
  end
end
