class LineItemsController < ApplicationController
  before_action :set_line_item, except: [:create]

  def create
    food_item = FoodItem.find(params[:food_item_id])
    @line_item = @cart.add_food_item(food_item)

    respond_to do |format|
      if @line_item.save
        format.js 
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        if @line_item.quantity <=0
          @line_item.destroy
        end
        format.html { redirect_to my_cart_path }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def increase_quantity
    @line_item.update_attribute(:quantity, @line_item.quantity+1)
    redirect_to my_cart_path
  end

  def decrease_quantity
    @line_item.update_attribute(:quantity, @line_item.quantity-1)
    if @line_item.quantity <=0
      @line_item.destroy
    end
    redirect_to my_cart_path
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to my_cart_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:food_item_id, :quantity)
    end
end
