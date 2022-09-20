require "rails_helper"

#As a visitor
#When I visit a dish's show page
#I see the dish’s name and description
#And I see a list of ingredients for that dish
#And I see the chef's name.
RSpec.describe("Dishes Show page") do
  it("I see the dish’s name and description") do
    chef1 = Chef.create!(    name: "Chef1")
    dish1 = Dish.create!(    name: "hot dog",     description: "hot n ready",     chef_id: chef1.id)
    ingredient1 = Ingredient.create!(    name: "Ketchup",     calories: 204)
    DishIngredient.create!(    dish_id: dish1.id,     ingredient_id: ingredient1.id)
    visit("/dishes/#{dish1.id}")
    expect(page).to(have_content("Name:#{dish1.name}"))
    expect(page).to(have_content("Description:#{dish1.description}"))
    expect(page).to(have_content("Ingredients:#{ingredient1.name}"))
    expect(page).to(have_content("Chefs name:#{chef1.name}"))
  end

  #As a visitor
  #When I visit a dish's show page
  #I see the total calorie count for that dish.
  it("I see the total calorie count for that dish.") do
    chef1 = Chef.create!(    name: "Chef1")
    dish1 = chef1.dishes.create!(    name: "hot dog",     description: "hot n ready",     chef_id: chef1.id)
    ingredient1 = Ingredient.create!(    name: "Ketchup",     calories: 204)
    ingredient2 = Ingredient.create!(    name: "Mustard",     calories: 206)
    DishIngredient.create!(    dish_id: dish1.id,     ingredient_id: ingredient1.id)
    DishIngredient.create!(    dish_id: dish1.id,     ingredient_id: ingredient2.id)
    visit("/dishes/#{dish1.id}")
    expect(page).to(have_content("Calorie Count:410"))
  end
end
