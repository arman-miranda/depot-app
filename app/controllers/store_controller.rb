class StoreController < ApplicationController
  include CurrentCart
  
  skip_before_action :authorize
  before_action :set_cart
  
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title).page(params[:page])
    end
    
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
