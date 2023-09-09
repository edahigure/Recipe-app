require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  let!(:current_user) { User.create(name: 'Akai', email: 'akai123@gmail.com', password: '123456') }

  describe 'GET /index' do
    before do
      current_user.confirm
      sign_in current_user
    end

    it 'returns http success' do
      get foods_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    before do
      current_user.confirm
      sign_in current_user
    end

    it 'returns http success' do
      get new_food_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    before do
      current_user.confirm
      sign_in current_user
    end

    it 'returns http success' do
      post foods_path,
           params: { food: { name: 'Apple', measurement_unit: 'kg', price: '20', quantity: '10',
                             user_id: current_user.id } }
      expect(response).to have_http_status(:found)
    end
  end

  # test delete
  describe 'DELETE /destroy' do
    let(:food) do
      Food.create(name: 'Apple', measurement_unit: 'kg', price: '20', quantity: '10', user_id: current_user.id)
    end

    before do
      current_user.confirm
      sign_in current_user
    end

    it 'returns http success' do
      delete food_path(food)
      expect(response).to have_http_status(:found)
    end
  end
end
