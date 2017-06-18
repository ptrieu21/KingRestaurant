class LineItem < ApplicationRecord
	belongs_to :order, optional: true
  belongs_to :food_item, optional: true
  belongs_to :cart

  def total_price
  	food_item.price * quantity
  end
end
