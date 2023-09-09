# rspec spec/request/public_recipes_spec.rb
require 'rails_helper'

RSpec.describe 'Public Recipies', type: :system do
  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com', role: 'user', password: 'qweqwe')
  end

  let(:milk) do
    Food.create(name: 'milk', measurement_unit: 'Lt', price: 20.5, quantity: '10', user_id: user.id)
  end

  let(:cambur) do
    Food.create(name: 'cambur', measurement_unit: 'unit', price: 2.5, quantity: '10', user_id: user.id)
  end

  let(:suggar) do
    Food.create(name: 'suggar', measurement_unit: 'kg', price: 20, quantity: '10', user_id: user.id)
  end

  let(:manzana) do
    Food.create(name: 'Manzana', measurement_unit: 'unit', price: 5, quantity: '10', user_id: user.id)
  end

  let(:licuado_de_cambur) do
    Recipe.create(name: 'licuado de cambur', preparation_time: '5 min', cooking_time: 'no coking needed',
                  description: 'Mezcle la leche y el cambur en una licuadora, agrege azucar al gusto ' \
                  'y listo', public: true, user_id: user.id)
  end

  before :each do
    RecipeFood.create(quantity: 1, recipe: licuado_de_cambur, food_id: milk.id)
    RecipeFood.create(quantity: 1, recipe: licuado_de_cambur, food_id: cambur.id)
    RecipeFood.create(quantity: 0.01, recipe: licuado_de_cambur, food_id: suggar.id)

    user.confirm
    sign_in user
  end

  describe 'index page' do
    it 'shows the right content' do
      visit public_recipes_path
      expect(page).to have_content('Public Recipes')
      expect(page).to have_content('Recipe: licuado de cambur')
      expect(page).to have_content('by Jose')
      expect(page).to have_content('Total food items: 3')
      expect(page).to have_content('Total price: $ 23.2')
    end
  end

  scenario 'when clibking on a recipe' do
    visit public_recipes_path
    click_on 'Details'

    expect(page).to have_current_path(recipe_path(licuado_de_cambur))
  end

end
