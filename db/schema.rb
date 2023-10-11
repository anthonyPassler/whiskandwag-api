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

ActiveRecord::Schema[7.0].define(version: 2023_10_11_183517) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "allergens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_allergens_on_name", unique: true
  end

  create_table "dog_allergies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "dog_id", null: false
    t.uuid "allergen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allergen_id"], name: "index_dog_allergies_on_allergen_id"
    t.index ["dog_id"], name: "index_dog_allergies_on_dog_id"
  end

  create_table "dog_medical_conditions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "dog_id", null: false
    t.uuid "medical_condition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_dog_medical_conditions_on_dog_id"
    t.index ["medical_condition_id"], name: "index_dog_medical_conditions_on_medical_condition_id"
  end

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

  create_table "medical_conditions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_medical_conditions_on_name", unique: true
  end

  create_table "order_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "order_id"
    t.uuid "recipe_id"
    t.integer "quantity"
    t.integer "portion_weight_in_grams"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["recipe_id"], name: "index_order_items_on_recipe_id"
  end

  create_table "orders", id: :uuid, default: -> { "public.gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "total_price", precision: 10, scale: 2
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "dog_id"
    t.datetime "dispatch_date", precision: nil
    t.string "status"
    t.datetime "fulfilled_at"
    t.uuid "subscription_id"
    t.index ["dog_id"], name: "index_orders_on_dog_id"
    t.index ["subscription_id"], name: "index_orders_on_subscription_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "recipe_allergens", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "recipe_id", null: false
    t.uuid "allergen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allergen_id"], name: "index_recipe_allergens_on_allergen_id"
    t.index ["recipe_id"], name: "index_recipe_allergens_on_recipe_id"
  end

  create_table "recipe_medical_condition_exclusions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "recipe_id", null: false
    t.uuid "medical_condition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_condition_id"], name: "index_recipe_exclusions_on_medical_condition_id"
    t.index ["recipe_id"], name: "index_recipe_medical_condition_exclusions_on_recipe_id"
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
    t.index ["name"], name: "index_recipes_on_name", unique: true
  end

  create_table "recommended_recipes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "dog_id"
    t.uuid "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id", "recipe_id"], name: "index_recommended_recipes_on_dog_id_and_recipe_id", unique: true
    t.index ["dog_id"], name: "index_recommended_recipes_on_dog_id"
    t.index ["recipe_id"], name: "index_recommended_recipes_on_recipe_id"
  end

  create_table "reviews", id: :uuid, default: -> { "public.gen_random_uuid()" }, force: :cascade do |t|
    t.text "description"
    t.decimal "rating"
    t.string "image_url"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "recipe_id"
    t.index ["recipe_id"], name: "index_reviews_on_recipe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "subscriptions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "fulfillment_frequency_in_weeks"
    t.string "status"
    t.string "cancellation_reason"
    t.datetime "cancelled_at"
    t.datetime "paused_at"
    t.datetime "paused_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dog_allergies", "allergens"
  add_foreign_key "dog_allergies", "dogs"
  add_foreign_key "dog_medical_conditions", "dogs"
  add_foreign_key "dog_medical_conditions", "medical_conditions"
  add_foreign_key "dogs", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "recipes"
  add_foreign_key "orders", "dogs"
  add_foreign_key "orders", "subscriptions"
  add_foreign_key "orders", "users"
  add_foreign_key "recipe_allergens", "allergens"
  add_foreign_key "recipe_allergens", "recipes"
  add_foreign_key "recipe_medical_condition_exclusions", "medical_conditions"
  add_foreign_key "recipe_medical_condition_exclusions", "recipes"
  add_foreign_key "recommended_recipes", "dogs"
  add_foreign_key "recommended_recipes", "recipes"
  add_foreign_key "reviews", "recipes"
  add_foreign_key "reviews", "users"
  add_foreign_key "subscriptions", "users"
end
