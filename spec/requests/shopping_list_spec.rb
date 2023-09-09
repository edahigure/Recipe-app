# rspec ./spec/requests/shopping_list_spec.rb
require 'rails_helper'

RSpec.describe 'Shopping list', type: :request do
  let!(:current_user) { User.create(name: 'Akai', email: 'akai123@gmail.com', password: '123456') }

  describe 'GET /index' do
    before do
      current_user.confirm
      sign_in current_user
    end

    it 'returns http success' do
      get shopping_list_index_path
      expect(response).to have_http_status(:success)
    end
  end
end
