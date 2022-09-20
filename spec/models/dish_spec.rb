require "rails_helper"


RSpec.describe(Dish, type: :model) do
  describe("validations") do
    it { should(validate_presence_of(:name)) }
    it { should(validate_presence_of(:description)) }
  end

  describe("relationships") do
    it { should(belong_to(:chef)) }
  end

  describe("model test sum") do
    it("can add all calories together") do
      chef1 = Chef.create!(      name: "Chef1")
      dish1 = chef1.dishes.create!(      name: "hot dog",       description: "hot n ready",       chef_id: chef1.id)
      ingredient1 = Ingredient.create!(      name: "Ketchup",       calories: 204)
      ingredient2 = Ingredient.create!(      name: "Mustard",       calories: 206)
      DishIngredient.create!(      dish_id: dish1.id,       ingredient_id: ingredient1.id)
      DishIngredient.create!(      dish_id: dish1.id,       ingredient_id: ingredient2.id)
      expect(dish1.cal_count).to(eq(410))
    end
  end
end
