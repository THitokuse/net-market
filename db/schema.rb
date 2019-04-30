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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_14_043853) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment", null: false
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "authorization_code", null: false
    t.string "security_code", null: false
    t.string "month", null: false
    t.string "year", null: false
    t.bigint "user_id", null: false
    t.string "payjp_token"
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "delivery_burdens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_dates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "prefecture_code", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "size_id", null: false
    t.bigint "upper_category_id", null: false
    t.bigint "middle_category_id", null: false
    t.bigint "lower_category_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "delivery_burden_id", null: false
    t.bigint "delivery_date_id", null: false
    t.bigint "delivery_method_id", null: false
    t.bigint "user_id", null: false
    t.bigint "condition_id", null: false
    t.bigint "status_id", null: false
    t.integer "purchase_status"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["condition_id"], name: "index_items_on_condition_id"
    t.index ["delivery_burden_id"], name: "index_items_on_delivery_burden_id"
    t.index ["delivery_date_id"], name: "index_items_on_delivery_date_id"
    t.index ["delivery_method_id"], name: "index_items_on_delivery_method_id"
    t.index ["lower_category_id"], name: "index_items_on_lower_category_id"
    t.index ["middle_category_id"], name: "index_items_on_middle_category_id"
    t.index ["size_id"], name: "index_items_on_size_id"
    t.index ["status_id"], name: "index_items_on_status_id"
    t.index ["upper_category_id"], name: "index_items_on_upper_category_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "lower_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "middle_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["middle_category_id"], name: "index_lower_categories_on_middle_category_id"
  end

  create_table "middle_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "upper_category_id"
    t.bigint "size_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_type_id"], name: "index_middle_categories_on_size_type_id"
    t.index ["upper_category_id"], name: "index_middle_categories_on_upper_category_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "trading_partner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["trading_partner_id"], name: "index_orders_on_trading_partner_id"
  end

  create_table "size_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "size_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "size_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_type_id"], name: "index_sizes_on_size_type_id"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trading_partners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "buyer_id", null: false
    t.bigint "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_trading_partners_on_buyer_id"
    t.index ["seller_id"], name: "index_trading_partners_on_seller_id"
  end

  create_table "upper_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.string "first_name_kana"
    t.string "last_name_kana"
    t.string "tel"
    t.integer "prefecture_code"
    t.string "zip"
    t.string "street"
    t.integer "birth_day"
    t.integer "birth_month"
    t.integer "birth_year"
    t.text "self_introduce"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.string "meta"
    t.string "city_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "credits", "users"
  add_foreign_key "item_images", "items"
  add_foreign_key "middle_categories", "upper_categories"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "trading_partners"
  add_foreign_key "trading_partners", "users", column: "buyer_id"
  add_foreign_key "trading_partners", "users", column: "seller_id"
end
