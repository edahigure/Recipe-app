# rspec spec/request/foods_spec.rb
require 'rails_helper'

RSpec.describe 'Foods page', type: :system do
  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com', role: 'user', password: 'qweqwe')
  end

  let!(:milk) do
    Food.create(name: 'milk', measurement_unit: 'Lt', price: 20.5, quantity: '10', user_id: user.id)
  end

  before :each do
    user.confirm
    sign_in user
  end

  describe 'index page' do
    it 'shows the right content' do
      visit foods_path
      expect(page).to have_content('Foods')
      expect(page).to have_content('milk')
    end

    scenario 'when clicking delete on a food' do
      visit foods_path
      click_link 'Delete'
      expect(page).not_to have_content('milk')
    end

    scenario 'when clicking new food' do
      visit foods_path
      click_link 'New food'
      fill_in 'Name', with: 'vainilla'
      fill_in 'Measurement unit', with: 'Lt'
      fill_in 'Price', with: '25'
      fill_in 'Quantity', with: '1'
      click_button 'Create Food'
      expect(page).to have_content('vainilla')
    end
  end
end
