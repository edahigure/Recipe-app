# rspec spec/request/recipes_spec.rb
require 'rails_helper'

RSpec.describe 'Recipes Index', type: :feature do
  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com', role: 'user', password: 'qweqwe')
  end

  let!(:milk) do
    Food.create(name: 'milk', measurement_unit: 'Lt', price: 20.5, quantity: '10', user_id: user.id)
  end

  let!(:cambur) do
    Food.create(name: 'cambur', measurement_unit: 'unit', price: 2.5, quantity: '10', user_id: user.id)
  end

  let!(:sugar) do
    Food.create(name: 'sugar', measurement_unit: 'kg', price: 20, quantity: '10', user_id: user.id)
  end

  let!(:manzana) do
    Food.create(name: 'Manzana', measurement_unit: 'unit', price: 5, quantity: '10', user_id: user.id)
  end

  let!(:licuado_de_cambur) do
    Recipe.create(name: 'licuado de cambur', preparation_time: '5 min', cooking_time: 'no coking needed',
                  description: 'Mezcle la leche y el cambur en una licuadora, agrege azucar al
                   gusto y listo', public: true, user_id: user.id)
  end

  before :each do
    RecipeFood.create(quantity: 1, recipe: licuado_de_cambur, food_id: milk.id)
    RecipeFood.create(quantity: 1, recipe: licuado_de_cambur, food_id: cambur.id)
    RecipeFood.create(quantity: 0.01, recipe: licuado_de_cambur, food_id: sugar.id)

    user.confirm
    sign_in user
    visit recipes_path
  end

  describe 'index page' do
    it 'shows the right content' do
      expect(page).to have_content('Recipes')
      expect(page).to have_content('Recipe: licuado de cambur')
      expect(page).to have_content('Mezcle la leche y el cambur en una licuadora, agrege azucar al gusto y listo')
    end
  end

  scenario 'when clicking show more' do
    click_link 'Show more'
    expect(page).to have_current_path(recipe_path(licuado_de_cambur))
  end

  scenario 'when clicking delete recipe' do
    click_button 'Delete recipe'
    expect(page).not_to have_content('Recipe: licuado de cambur')
  end
end
