# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# Cocktail.create(name: "daiquiri")
# Cocktail.create(name: "tequilla")
# Cocktail.create(name: "pear")
# Dose.create(description: "6cl", ingredient: Ingredient.find_by(name: "lemon"), cocktail: Cocktail.find_by(name: daiquiri)
# Dose.create(description: "8cl", ingredient: Ingredient.find_by(name: "lemon"), cocktail: Cocktail.find_by(name: daiquiri)

require 'faker'
require 'open-uri'

Cocktail.destroy_all
Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_list = JSON.parse(open(url).read)["drinks"]

ingredients_list.each do |ingredient_hash|
  Ingredient.create!(
      name: ingredient_hash["strIngredient1"]
    )
end

10.times do |index|
  cocktail = Cocktail.create!(
    name: Faker::Pokemon.name + " " + Faker::DragonBall.character
    )
  5.times do
    dose = Dose.create!(
        description: "5cl",
        cocktail: cocktail,
        ingredient: Ingredient.all.sample
      )
  end
end
