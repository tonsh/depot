class AdminController < ApplicationController
  def index
  end

  #等待发货列表
  def ship
    @pending_orders = Order.pending_shipping
  end
end
