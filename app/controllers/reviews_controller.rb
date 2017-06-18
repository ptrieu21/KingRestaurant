class ReviewsController < ApplicationController
  before_action :set_food_item


  # POST /reviews
  # POST /reviews.json
  def create
    @review = @food_item.reviews.create(review_params)

    if @review.save
      redirect_to food_item_path(@food_item)
    else
      render 'new'
    end
  end

  private
    def set_food_item
      @food_item = FoodItem.find(params[:food_item_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:username, :content, :food_item_id)
    end
end
