class FoodItem < ApplicationRecord
	belongs_to :section
	has_many :line_items
	has_many :orders, through: :line_items

	before_destroy :ensure_not_referenced_by_any_line_item

	def self.search(search)
		where("name ILIKE ?", "%#{search}%")
	end

	private
		def ensure_not_referenced_by_any_line_item
			unless line_items.empty?
				errors.add(:base, 'Line Items present')
				throw :abort
			end
		end
end
