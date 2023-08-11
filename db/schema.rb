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

ActiveRecord::Schema[7.0].define(version: 2023_08_11_062403) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "dogs", id: :uuid, default: -> { "public.gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "weight"
    t.integer "age_in_months"
    t.string "gender"
    t.string "fussiness_level"
    t.string "activity_level"
    t.integer "recommended_daily_calories"
    t.integer "food_portion_in_grams"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sterialized"
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "orders", id: :uuid, default: -> { "public.gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "total_price", precision: 10, scale: 2
    t.integer "portions"
    t.integer "portion_weight_in_grams"
    t.integer "frequency_in_weeks"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "recipes", id: :uuid, default: -> { "public.gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "calories_per_100g"
    t.text "ingredients"
    t.decimal "fat_percentage"
    t.string "image_url"
    t.decimal "price_per_100g"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", id: :uuid, default: -> { "public.gen_random_uuid()" }, force: :cascade do |t|
    t.text "description"
    t.decimal "rating"
    t.string "image_url"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "public.gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "telephone"
    t.string "address"
    t.string "zip_code"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "subscribed", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dogs", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "users"
end
