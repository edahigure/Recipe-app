#rspec spec/request/public_recipes_spec.rb
require 'rails_helper'

RSpec.describe 'Public Recipies', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit public_recipes_path
      expect(page).to have_content('Public Recipes')
    end
  end
end