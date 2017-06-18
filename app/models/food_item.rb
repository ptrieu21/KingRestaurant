class FoodItem < ApplicationRecord
	belongs_to :section
	belongs_to :cuisine
	has_many :line_items
	has_many :reviews
	has_many :orders, through: :line_items
	is_impressionable counter_cache: true, column_name: :views, :unique => :all

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
