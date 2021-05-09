# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_09_200832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name", limit: 128
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "company", limit: 128
    t.decimal "cost", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_deliveries_on_users_id"
  end

  create_table "deliveries_products", id: false, force: :cascade do |t|
    t.bigint "delivery_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.index ["delivery_id"], name: "index_deliveries_products_on_delivery_id"
    t.index ["product_id"], name: "index_deliveries_products_on_product_id"
  end

  create_table "product_sales", force: :cascade do |t|
    t.integer "product_id"
    t.integer "sale_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 128
    t.integer "quantity"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "barcode", limit: 12
    t.index ["user_id"], name: "index_products_on_users_id"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "total_price", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_sales_on_clients_id"
    t.index ["user_id"], name: "index_sales_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.string "name", limit: 60
    t.boolean "premium", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "users_clients", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "client_id"
    t.decimal "currency", precision: 10, scale: 2
    t.index ["client_id"], name: "index_users_clients_on_client_id"
    t.index ["user_id"], name: "index_users_clients_on_user_id"
  end

  create_trigger("product_sales_after_insert_row_tr", :generated => true, :compatibility => 1).
      on("product_sales").
      after(:insert) do
    <<-SQL_ACTIONS
UPDATE sales
        SET total_price = total_price + products.price
        FROM products
        WHERE sales.id = NEW.sale_id AND products.id = NEW.product_id;
        UPDATE products
        SET quantity = quantity - 1
        WHERE products.id = NEW.product_id;
    SQL_ACTIONS
  end

end
