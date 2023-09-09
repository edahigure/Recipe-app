#rspec spec/request/recipe_detail_spec.rb
require 'rails_helper'

RSpec.describe 'Recipie detal', type: :feature do

  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com',role: 'user',password: 'qweqwe')
  end

  let!(:milk) do
     Food.create(name: 'milk',measurement_unit: 'Lt',price: 20.5, quantity: '10', user_id: user.id)
  end

  let!(:cambur) do
     Food.create(name: 'cambur',measurement_unit: 'unit',price: 2.5, quantity: '10', user_id: user.id)
  end

  let!(:suggar) do
    Food.create(name: 'suggar',measurement_unit: 'kg',price: 20, quantity: '10', user_id: user.id)
  end

  let!(:manzana) do
     Food.create(name: 'Manzana',measurement_unit: 'unit',price: 5, quantity: '10', user_id: user.id)
  end

  let!(:vainilla) do
    Food.create(name: 'vainilla',measurement_unit: 'Lt',price: 25, quantity: '1', user_id: user.id)
  end

  let!(:licuado_de_cambur) do    
    Recipe.create(name: 'licuado de cambur' , preparation_time: '5 min', cooking_time: 'no cooking needed', description: 'Mezcle la leche y el cambur en una licuadora, agrege azucar al gusto y listo', public: true, user_id: user.id)
  end 


  before :each do
    RecipeFood.create(quantity: 1, recipe: licuado_de_cambur, food_id: milk.id)
    RecipeFood.create(quantity: 1, recipe: licuado_de_cambur, food_id: cambur.id)
    RecipeFood.create(quantity: 0.01, recipe: licuado_de_cambur, food_id: suggar.id)

    user.confirm
    sign_in user
  end
  
  describe 'Recipe detail page' do
    it 'shows the right content' do
     
      visit recipe_path(licuado_de_cambur)
        
      expect(page).to have_content('licuado de cambur')
      expect(page).to have_content('Preparation time: 5 min')
      expect(page).to have_content('no cooking needed')
      expect(page).to have_content("#{licuado_de_cambur.description}")

      
    end
  end

  scenario 'when clicking generate shopping list' do
    click_link 'Generate shoppig list'
    expect(page).to have_current_path(shopping_list_index_path) 
  end

  scenario 'when clicking delete on an ingredient' do
    click_link 'Delete', id: dom_id milk
    expect(page).not_to have_content("milk")
  end

  scenario 'when clicking on add an ingredient' do
    click_link 'Add ingredient'
    find('#food-selector').select('vainilla')
    expect(page).to 
  end

end