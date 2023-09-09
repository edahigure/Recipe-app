#rspec spec/request/foods_spec.rb
require 'rails_helper'

RSpec.describe 'Foods page', type: :feature do

  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com',role: 'user',password: 'qweqwe')
  end

  let(:milk) do
     Food.create(name: 'milk',measurement_unit: 'Lt',price: 20.5, quantity: '10', user_id: user.id)
  end

  
  before :each do
    user.confirm
    sign_in user
    visit foods_path 
    
  end
  
  describe 'index page' do
    it 'shows the right content' do
  
      expect(page).to have_content('Foods')
      expect(page).to have_content('milk')
      
    end

    scenario 'when clicking delete on a food' do
      click_link 'Delete'
      expect(page).not_to have_content('milk')
    end

    scenario 'when clicking new food' do
      click_link 'New food'
      fill_in name, with: 'vainilla'
      fill_in measurement_unit, with: 'Lt'
      fill_in price, with: '25'      
      fill_in quantity, with: '1'
      lick_button 'Create Food'
      expect(page).to have_content("vainilla")
    end
    
  end
end