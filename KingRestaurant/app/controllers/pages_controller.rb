class PagesController < ApplicationController

	def home
	end

	def contact_us
	end

	def menu
		@sections = Section.all
		if params[:section_id].present?
			@food_items = Section.find(params[:section_id]).food_items.all
		else
			@food_items = FoodItem.all
		end

		if params[:sort_type]
			@food_items = @food_items.order("#{params[:sort_type]} #{params[:order]}")
		end
	end
end
