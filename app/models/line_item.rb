class LineItem < ApplicationRecord
	belongs_to :order, optional: true
  belongs_to :food_item, optional: true
  belongs_to :cart
  default_scope { order(created_at: :desc) }
  def total_price
  	food_item.price * quantity
  end
end
