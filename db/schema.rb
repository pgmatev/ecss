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

ActiveRecord::Schema.define(version: 2021_01_26_220517) do

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
    t.index ["delivery_id"], name: "index_deliveries_products_on_delivery_id"
    t.index ["product_id"], name: "index_deliveries_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 128
    t.integer "quantity"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.string "barcode", limit: 12
    t.index ["users_id"], name: "index_products_on_users_id"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.bigint "clients_id"
    t.index ["clients_id"], name: "index_sales_on_clients_id"
    t.index ["users_id"], name: "index_sales_on_users_id"
  end

  create_table "sales_products", id: false, force: :cascade do |t|
    t.bigint "sale_id"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_sales_products_on_product_id"
    t.index ["sale_id"], name: "index_sales_products_on_sale_id"
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

end
