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

ActiveRecord::Schema.define(version: 2021_02_01_205744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "price_histories", force: :cascade do |t|
    t.decimal "price", precision: 6, scale: 2
    t.date "date"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_price_histories_on_product_id"
  end

  create_table "price_trackers", force: :cascade do |t|
    t.decimal "target_price", precision: 6, scale: 2
    t.time "update_frequency"
    t.decimal "current_price", precision: 6, scale: 2
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_price_trackers_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sites_products", id: false, force: :cascade do |t|
    t.bigint "site_id"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_sites_products_on_product_id"
    t.index ["site_id"], name: "index_sites_products_on_site_id"
  end

  create_table "vouchers", force: :cascade do |t|
    t.integer "saving"
    t.date "expiry_date"
    t.bigint "site_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["site_id"], name: "index_vouchers_on_site_id"
  end

end
