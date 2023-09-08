#rspec spec/request/recipe_detail_spec.rb
require 'rails_helper'

RSpec.describe 'Recipie detal', type: :feature do

  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com',role: 'user',password: 'qweqwe')
  end

  let(:milk) do
     Food.create(name: 'milk',measurement_unit: 'Lt',price: 20.5, quantity: '10', user_id: user.id)
  end

  let(:cambur) do
     Food.create(name: 'cambur',measurement_unit: 'unit',price: 2.5, quantity: '10', user_id: user.id)
  end

  let(:suggar) do
    Food.create(name: 'suggar',measurement_unit: 'kg',price: 20, quantity: '10', user_id: user.id)
  end

  let(:manzana) do
     Food.create(name: 'Manzana',measurement_unit: 'unit',price: 5, quantity: '10', user_id: user.id)
  end

  let(:licuado_de_cambur) do    
    Recipe.create(name: 'licuado de cambur' , preparation_time: '5 min', cooking_time: 'no cooking needed', description: 'Mezcle la leche y el cambur en una licuadora, agrege azucar al gusto y listo', public: true, user_id: user.id)
   
  end 


  before :each do
   

  end
  
  describe 'index page' do
    it 'shows the right content' do

      RecipeFood.create(quantity: 1, recipe: licuado_de_cambur, food_id: milk.id)
      RecipeFood.create(quantity: 1, recipe: licuado_de_cambur, food_id: cambur.id)
      RecipeFood.create(quantity: 0.01, recipe: licuado_de_cambur, food_id: suggar.id)
  
      visit recipe_path(licuado_de_cambur.id)
    
      fill_in('user_email', :with => 'edahigure@hotmail.com')
      fill_in('user_password', :with => 'qweqwe')
      click_button('Log in')
      
      expect(page).to have_content('licuado de cambur')
      expect(page).to have_content('Preparation time: 5 min')
      expect(page).to have_content('no cooking needed')
      expect(page).to have_content("Description: #{licuado_de_cambur.description}")

      
    end
  end
end