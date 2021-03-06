# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120814134908) do

  create_table "line_items", :force => true do |t|
    t.integer  "product_id",                                               :null => false
    t.integer  "quantity",                                  :default => 0, :null => false
    t.decimal  "unit_price", :precision => 10, :scale => 2,                :null => false
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "order_id",                                  :default => 0, :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "name",       :limit => 100, :null => false
    t.string   "email",                     :null => false
    t.text     "address",                   :null => false
    t.string   "pay_type",   :limit => 10,  :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.datetime "shipped_at"
  end

  create_table "products", :force => true do |t|
    t.string   "title",          :limit => 100,                                                 :null => false
    t.text     "description"
    t.string   "image_url",      :limit => 200,                                                 :null => false
    t.decimal  "price",                         :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.datetime "date_available"
    t.datetime "created_at",                                                                    :null => false
    t.datetime "updated_at",                                                                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",       :limit => 100, :null => false
    t.string   "password",   :limit => 40,  :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
