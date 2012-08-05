class Product < ActiveRecord::Base
  attr_accessible :date_available, :description, :image_url, :price, :title
end
