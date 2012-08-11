class LineItem < ActiveRecord::Base
  attr_accessible :quantity, :product_id, :unit_price

  belongs_to :product
  belongs_to :order

  def self.add_item product
    item = self.new(:quantity => 1, :product_id => product.id, :unit_price => product.price)
    item.save
    item.id
  end
end
