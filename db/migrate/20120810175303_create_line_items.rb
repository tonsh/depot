class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :product_id, :null => false
      t.integer :quantity, :null => false, :default => 0 
      t.decimal :unit_price, :precision => 10, :scale =>2, :null => false

      t.timestamps
    end
  end
end
