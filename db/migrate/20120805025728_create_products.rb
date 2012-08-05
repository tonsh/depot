class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, :limit => 100, :null => false
      t.text :description
      t.string :image_url, :limit => 200, :null => false
      t.decimal :price, :precision => 10, :scale => 2, :null => false, :default => 0
      t.datetime :date_available

      t.timestamps
    end
  end
end
