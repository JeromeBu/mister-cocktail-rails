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

mojito = Cocktail.create!(name: "Mojito")
bloody_marry = Cocktail.create!(name: "Bloody Marry")
caipirinha = Cocktail.create!(name: "Caipirinha")
Cocktail.create!(name: "Margarita")
Cocktail.create!(name: "Martini")
Cocktail.create!(name: "Piña Colada")

Dose.create!(cocktail: mojito, ingredient: Ingredient.find_by(name: "Rum"), description: "6 cl")
Dose.create!(cocktail: mojito, ingredient: Ingredient.find_by(name: "Lemon"), description: "Juice of 2")
Dose.create!(cocktail: mojito, ingredient: Ingredient.find_by(name: "Mint"), description: "A full hand of fresh")

Dose.create!(cocktail: caipirinha, ingredient: Ingredient.find_by(name: "Cachaca"), description: "6 cl")
Dose.create!(cocktail: caipirinha, ingredient: Ingredient.find_by(name: "Lemon"), description: "Juice of 2")
Dose.create!(cocktail: caipirinha, ingredient: Ingredient.find_by(name: "Mint"), description: "A full hand of fresh")

Dose.create!(cocktail: bloody_marry, ingredient: Ingredient.find_by(name: "Tomato juice"), description: "Half a glass")


puts "---------------  Seeded with success ^_^ -----------------"

