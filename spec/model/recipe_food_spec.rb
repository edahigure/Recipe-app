#rspec ./spec/model/recipe_food_spec.rb
require 'rails_helper'

RSpec.describe Food, type: :model do

  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com',role: 'user')
  end

  let(:recipe) do
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
    Food.create(name: 'milk',measurement_unit: 'Lt',price: 20.5, quantity: 10, user_id: user.id)
  end

  let!(:recipe_food) do
    RecipeFood.create(quantity: 0.5, recipe_id: recipe, food_id: food.id)
  end

  describe 'Check data values' do

    it 'Should have a name' do
      expect(recipe_food.quantity).to eq(0.5)
    end

    it 'Should have recipe_id' do
      expect(recipe_food.recipe_id).to eq(recipe.id)
    end

    it 'Should have food_id' do
      expect(recipe_food.food_id).to eq(food.id)
    end

  end
end