class FoodItemSection < ApplicationRecord
  belongs_to :food_item
  belongs_to :section
end
