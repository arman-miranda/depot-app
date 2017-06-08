class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @products = Product.order(:title)
    
    if session[:counter].nil?
      session[:counter] = 0
    else
      session[:counter] += 1
    end
    
    if show_counter?
      @message = "#{session[:counter]} visits"
    end
    
  end
  
  def show_counter?
    session[:counter] > 5
  end

end
