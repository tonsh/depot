class Cart
  attr_reader :items, :total_price

  def initialize
    @items = LineItem.cart_items
    @total_price = total_price
  end

  def total_price
    total = 0
    @items.each do |itemId, item|
      total += (item.quantity * item.unit_price)
    end
    total
  end

  def add_product product
    item = LineItem.add_product(product) 
    @items[item.id] = item
    @total_price += product.price
  end

  def empty!
    LineItem.empty_cart
    @items = []
    @total_price = 0
  end
end
