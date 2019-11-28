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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_11_25_103406) do
=======
ActiveRecord::Schema.define(version: 2019_11_25_085958) do
>>>>>>> 19fc712... finish choice of text ou rating
=======
ActiveRecord::Schema.define(version: 2019_11_26_083159) do
>>>>>>> 2f7b7dd... t
=======
ActiveRecord::Schema.define(version: 2019_11_28_082452) do
>>>>>>> 94b022a... t

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "details"
    t.boolean "is_valid", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["restaurant_id"], name: "index_coupons_on_restaurant_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "value"
    t.index ["restaurant_id"], name: "index_favorites_on_restaurant_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "question_pools", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
    t.index ["restaurant_id"], name: "index_question_pools_on_restaurant_id"
=======
    t.bigint "user_id"
    t.string "nameq"
    t.index ["user_id"], name: "index_question_pools_on_user_id"
>>>>>>> 2f7b7dd... t
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "question_pool_id"
    t.string "cat"
    t.index ["question_pool_id"], name: "index_questions_on_question_pool_id"
  end

  create_table "restaurant_photos", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_restaurant_photos_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "name"
    t.string "category"
    t.string "address"
    t.text "description"
    t.string "hours"
    t.integer "rating"
    t.integer "pricing"
    t.string "phone_number"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "siret"
    t.index ["owner_id"], name: "index_restaurants_on_owner_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "restaurant_id"
    t.string "username"
    t.text "content"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content_title"
    t.string "token"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["token"], name: "index_reviews_on_token", unique: true
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "phone_number"
    t.integer "status"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "coupons", "restaurants"
  add_foreign_key "favorites", "restaurants"
  add_foreign_key "favorites", "users"
  add_foreign_key "question_pools", "restaurants"
  add_foreign_key "questions", "question_pools"
  add_foreign_key "restaurant_photos", "restaurants"
  add_foreign_key "restaurants", "users", column: "owner_id"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
