# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_02_11_140139) do
  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "website"
  end

  create_table "emails", force: :cascade do |t|
    t.text "body"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.string "menu_link"
    t.text "recipients"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_emails_on_company_id"
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.integer "menu_id", null: false
    t.string "name"
    t.integer "order_id", null: false
    t.decimal "price_amount", precision: 10, scale: 2
    t.string "price_currency", default: "USD"
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_items_on_menu_id"
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_menus_on_company_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.date "deadline_date"
    t.date "delivery_date"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address"
    t.string "name"
    t.integer "role"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "emails", "companies"
  add_foreign_key "items", "menus"
  add_foreign_key "items", "orders"
  add_foreign_key "menus", "companies"
  add_foreign_key "orders", "companies"
  add_foreign_key "orders", "users"
end
