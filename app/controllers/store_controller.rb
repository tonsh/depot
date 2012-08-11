class StoreController < ApplicationController
  def index
    @products = Product.salable_items
  end

  def find_cart
    session[:cart] ||= Cart.new
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.add_product(product)
    redirect_to(:action => 'display_cart')
  rescue
    logger.error("Attempt to access invalid product #{params[:id]}")
    flash[:notice] = "Invalid Product"
    redirect_to(:action => 'index')
  end

  def display_cart
    @cart = find_cart
    @items = @cart.get_items
  end
end
