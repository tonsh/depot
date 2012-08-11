class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name, :limit => 100, :null => false
      t.string :email, :null => false
      t.text  :address, :null => false
      t.string :pay_type, :limit => 10, :null => false

      t.timestamps
    end
  end
end
