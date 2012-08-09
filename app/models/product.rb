class Product < ActiveRecord::Base
  attr_accessible :date_available, :description, :image_url, :price, :title

  validates_presence_of :title, :image_url, :price
  validates_numericality_of :price
  validates_uniqueness_of :title

  validates_format_of :image_url,
                      :with => %r{^http:.+\.(gif|jpg|png)$}i,
                      :message => "product_image_url_format_error"

  protected
  def validate
    errors.add(:price, "product_price_should_be_positive") unless price.nil? || price >= 0.01
  end

  # 可销售货品
  def self.salable_items
    find(:all,
      :conditions => "date_available <= now()",
      :order => "date_available desc"
    )
  end
end
