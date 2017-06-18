class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_food_item(food_item)
		current_item = line_items.find_by(food_item_id: food_item.id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(food_item_id: food_item.id)
		end
		current_item
	end

	def total_price
		line_items.to_a.sum {|item| item.total_price}
	end
end
