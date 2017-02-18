# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all
Cocktail.destroy_all

url = open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
ingredients_array = JSON.parse(url)["drinks"]

ingredients_array.each do |ingredient|
  ingredient_string = ingredient["strIngredient1"]
  Ingredient.create!(name: ingredient_string)
end

Cocktail.create!(name: "Mojito")
Cocktail.create!(name: "Bloody Marry")

puts "---------------  Seeded with success ^_^ -----------------"
