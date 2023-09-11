# rspec ./spec/model/recipe_spec.rb
require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com', role: 'user', password: 'qweqwe')
  end

  let!(:recipe) do
    Recipe.create(
      name: 'Black Rice',
      preparation_time: '0.5',
      cooking_time: '3.5',
      description: 'Recipe Description',
      public: true,
      user_id: user.id
    )
  end

  describe 'attributes' do
    it 'should create a valid Recipe' do
      expect(recipe).to be_valid
    end

    it 'should not be valid when name is not present' do
      recipe.name = nil
      recipe.save
      expect(recipe).not_to be_valid
    end

    it 'Should have a name' do
      expect(recipe.name).to eq('Black Rice')
    end

    it 'Should have a preparation time' do
      expect(recipe.preparation_time).to eq('0.5')
    end

    it 'Should have a cooking time' do
      expect(recipe.cooking_time).to eq('3.5')
    end

    it 'Should have a description' do
      expect(recipe.description).to eq('Recipe Description')
    end
  end
end
