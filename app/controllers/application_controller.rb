class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart

  def current_cart
    if !session[:cart_id].nil?
      Order.find(session[:cart_id])
    else
      Order.new
    end
  end

  
end
