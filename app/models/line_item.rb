class LineItem < ActiveRecord::Base
  attr_accessible :quantity, :product_id, :unit_price

  belongs_to :product
  belongs_to :order

  def self.add_item product
    item = self.new(:quantity => 1, :product_id => product.id, :unit_price => product.price)
    item.save
    item
  end

  # 修改购买数量
  def self.update_quantity id, num = 1
    update_counters(id, :quantity => num)
  end

  def self.empty_cart
    where(:order_id => 0).delete_all
  end

  def self.add_product product
    cond = {:order_id => 0, :product_id => product.id, :unit_price => product.price }
    item = where(cond).limit(1)

    rslt = nil
    if item.empty?
      rslt = add_item(product)
    else
      update_quantity(item[0].id)
      rslt = find(item[0].id)
    end

    rslt
  end

  def self.cart_items
    items = where(:order_id => 0)

    rslt = {}
    items.each do |item|
      rslt[item.id] = item
    end
    rslt
  end
end
