class Cart
  attr_reader :items, :total_price

  def initialize
    @items = []
    @total_price = 0
  end

  def add_product product
    cond = {:product_id => product.id, :unit_price => product.price }
    item = LineItem.where(cond).limit(1)

    if item.empty?
      @items << LineItem.add_item(product)
    else
      LineItem.update_counters(item[0].id, :quantity => 1)
    end
    @total_price += product.price
  end

  def get_items
    items = LineItem.where(:id => @items)
    items
  end

  def empty!
    LineItem.where(:id => @items).delete_all
    @items = []
    @total_price = 0
  end
end
