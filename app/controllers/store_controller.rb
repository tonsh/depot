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
    redirect_with_flash("index", "Invalid Product")
  end

  def display_cart
    @cart = find_cart
    @items = @cart.get_items
  end

  def empty_cart
    @cart = find_cart
    @cart.empty!
    redirect_with_flash("display_cart", "Your Cart is now empty!")
  end

  def redirect_with_flash(action, msg = nil)
    flash[:notice] = msg if msg
    redirect_to(:action => action)
  end

  def checkout
    @cart = find_cart
    @items = @cart.get_items
    if @items.empty?
      redirect_with_flash("display_cart", "There's nothing in your cart!")
    else
      @order = Order.new
    end
  end

  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.line_items << @cart.get_items

    if @order.save
      @cart.empty!
      redirect_with_flash("index", "Thank you for your order!")
    else
      render(:action => "checkout")
    end
  end
end
