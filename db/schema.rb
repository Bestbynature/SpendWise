ActiveRecord::Schema[7.0].define(version: 2023_08_03_161122) do
  enable_extension "plpgsql"

  create_table "group_products", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_products_on_group_id"
    t.index ["product_id"], name: "index_group_products_on_product_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.bigint "author_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_products_on_author_id"
    t.index ["group_id"], name: "index_products_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role", default: "regular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "group_products", "groups"
  add_foreign_key "group_products", "products"
  add_foreign_key "groups", "users"
  add_foreign_key "products", "groups"
  add_foreign_key "products", "users", column: "author_id"
end
