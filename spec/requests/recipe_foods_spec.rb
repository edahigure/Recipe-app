require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  let!(:current_user) { User.create(name: 'Akai', email: 'akai123@gmail.com', password: '123456') }
  let!(:food) do
    Food.create(name: 'Apple', measurement_unit: 'kg', price: '20', quantity: '10', user_id: current_user.id)
  end
  let!(:recipe) do
    Recipe.create(name: 'Apple Pie', description: 'This is a test and does nothing else', cooking_time: '20',
                  preparation_time: '10', public: false, user_id: current_user.id)
  end

  describe 'POST /create' do

    before do
      current_user.confirm
      sign_in current_user
    end

    it 'returns http success when creating a recipe_food' do
      post recipe_foods_path, params: { recipe_food: { quantity: 1, recipe_id: recipe.id, food_id: food.id } }
      expect(response).to have_http_status(:found)
    end
  end 
  
  # test delete
  describe 'DELETE /destroy' do
    let(:recipe_food) do
      RecipeFood.create(quantity: 1, recipe_id: recipe.id, food_id: food.id)
    end

    before do
      current_user.confirm
      sign_in current_user
    end

    it 'returns http success' do
      delete recipe_food_path(recipe_food)
      expect(response).to have_http_status(:found)
    end
  end
  
end
