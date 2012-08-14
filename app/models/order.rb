class Order < ActiveRecord::Base
  attr_accessible :name, :email, :address, :pay_type
  has_many :line_items

  validates_presence_of :name, :email, :address, :pay_type

  PAYMENT_TYPES = [
    ["Check",           "check"],
    ["Credit Card",     "cc"],
    ["Purchase Order",  "po"],
  ].freeze

  def self.pending_shipping
    find(:all, :conditions => "shipped_at is null")
  end

  # 标记为已发货
  def mark_as_shipped
    self.shipped_at = Time.now
  end
end
