class StoreController < ApplicationController
  def index
    @products = Product.salable_items
  end

  def find_cart
    @cart ||= Cart.new
  end

  def add_to_cart
    product = Product.find(params[:id])
    find_cart.add_product(product)
    redirect_to(:action => 'display_cart')
  rescue
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_with_flash("index", "Invalid Product")
  end

  def display_cart
    @items = find_cart.items
  end

  def empty_cart
    find_cart.empty!
    redirect_with_flash("display_cart", "Your Cart is now empty!")
  end

  def redirect_with_flash(action, msg = nil)
    flash[:notice] = msg if msg
    redirect_to(:action => action)
  end

  def checkout
    @items = find_cart.items.values
    if @items.empty?
      redirect_with_flash("display_cart", "There's nothing in your cart!")
    else
      @order = Order.new
    end
  end

  def save_order
    @order = Order.new(params[:order])
    @order.line_items << find_cart.items.values

    if @order.save
      find_cart.empty!
      redirect_with_flash("index", "Thank you for your order!")
    else
      render(:action => "checkout")
    end
  end
end
