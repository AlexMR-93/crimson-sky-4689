require "rails_helper"

#As a visitor
#When I visit a chef's show page
#I see the name of that chef
#And I see a link to view a list of all ingredients that this chef uses in their dishes.
#When I click on that link
#I'm taken to a chef's ingredient index page
#and I can see a unique list of names of all the ingredients that this chef uses.
RSpec.describe("chef show page") do
  it("see the name of that chef") do
    chef1 = Chef.create!(    name: "Chef1")
    dish1 = chef1.dishes.create!(    name: "hot dog",     description: "hot n ready",     chef_id: chef1.id)
    ingredient1 = Ingredient.create!(    name: "Ketchup",     calories: 204)
    ingredient2 = Ingredient.create!(    name: "Mustard",     calories: 206)
    DishIngredient.create!(    dish_id: dish1.id,     ingredient_id: ingredient1.id)
    DishIngredient.create!(    dish_id: dish1.id,     ingredient_id: ingredient2.id)
    visit("/chefs/#{chef1.id}")
    expect(page).to(have_content("#{chef1.name}"))
  end
end
