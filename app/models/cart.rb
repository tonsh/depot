class Cart
  attr_reader :items, :total_price

  def initialize
    @items = []
    @total_price = 0
  end

  def add_product product
    item = @items.find {|i| i.product.id == product.id}
    if item
      item.quantity += 1
    else
      @items << LineItem.for_product(product)
    end
    @total_price += product.price
  end
end
