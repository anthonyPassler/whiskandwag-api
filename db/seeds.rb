# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding database..."
Recipe.destroy_all
Review.destroy_all
Order.destroy_all
User.destroy_all
RecommendedRecipe.destroy_all

user = User.create(email: "passleranthony@yahoo.com", password: "password", first_name: "Anthony",
                   last_name: "Passler", address: "1234 Main St", city: "Denver", zip_code: "80202", telephone: "303-555-5555")
recipe1 = Recipe.create(name: "Beef stew", calories_per_100g: 125, ingredients: "beef, potato, carrots", fat_percentage: 15,
              price_per_100g: 25)
recipe2 = Recipe.create(name: "Chicken stew", calories_per_100g: 225, ingredients: "chicken, peas, onions", fat_percentage: 25,
              price_per_100g: 35)
dog = Dog.create(name: "Lucky", breed: "Labrador", weight: 50, age_in_months: 60, gender: "male", fussiness_level: "medium",
          activity_level: "low", recommended_daily_calories: 1000, food_portion_in_grams: 200, user_id: user.id)
Review.create(description: "This is a great recipe!", rating: 5, user_id: user.id)
Order.create(total_price: 25, user_id: user.id, dog_id: dog.id)
RecommendedRecipe.create(dog_id: dog.id, recipe_id: recipe1.id)
RecommendedRecipe.create(dog_id: dog.id, recipe_id: recipe2.id)

puts "Done!"
