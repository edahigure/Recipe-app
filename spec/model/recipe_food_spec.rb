# rspec ./spec/model/recipe_food_spec.rb
require 'rails_helper'

RSpec.describe Food, type: :model do
  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com', role: 'user', password: 'qweqwe')
  end

  let!(:recipe) do
    Recipe.create(
      name: 'Pastel de fresa',
      preparation_time: '0.5',
      cooking_time: '3.5',
      description: 'Recipe Description',
      public: true,
      user_id: user.id
    )
  end

  let!(:food) do
    Food.create(name: 'milk', measurement_unit: 'Lt', price: 20.5, quantity: 10, user_id: user.id)
  end

  let!(:recipe_food) do
    RecipeFood.create(quantity: 0.5, recipe_id: recipe.id, food_id: food.id)
  end

  describe 'Check data values' do
    it 'Should be valid' do
      expect(recipe_food).to be_valid
    end

    it 'Should not be valid when quantity is negative' do
      recipe_food.quantity = -5.0
      recipe_food.save
      expect(recipe_food).not_to be_valid
    end
  end
end
