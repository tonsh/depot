class AdminController < ApplicationController
  def index
  end

  #等待发货列表
  def ship
    count = 0
    if things_to_ship = params[:to_be_ship]
      count = do_shipping(things_to_ship)
      if count > 0
        count_text = pluralize(count, "order")
        flash.now[:notice] = "#{count_text} marked as shipped"
      end
    end

    @pending_orders = Order.pending_shipping
  end

  def do_shipping things_to_ship
    count = 0
    things_to_ship.each do |order_id, do_it|
      if do_it == "yes"
        order = Order.find(order_id)
        order.mark_as_shipped
        order.save
        count += 1
      end
    end

    count
  end

  def pluralize count, noun
    case count
      when 0
        "No #{noun}"
      when 1
        "One #{noun}"
      else
        "#{count} #{noun}"
    end
  end
end
