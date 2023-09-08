#rspec ./spec/model/food_spec.rb
require 'rails_helper'

RSpec.describe Food, type: :model do

  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com',role: 'user')
  end
  let!(:food) do
    Food.create(name: 'milk',measurement_unit: 'Lt',price: 20.5, quantity: 10, user_id: user.id)
  end

  describe 'Check data values' do

    it 'Should have a name' do
      expect(food.name).to eq('milk')
    end

    it 'Should have a measurement_unit' do
      expect(food.measurement_unit).to eq('Lt')
    end

    it 'Should have a price' do
      expect(food.price).to eq(20.5)
    end

    it 'Should have a price' do
      expect(food.price).to eq(20.5)
    end

    it 'Should have a quantity' do
      expect(food.quantity).to eq(10)
    end

    it 'Should have a user_id' do
      expect(food.user_id).to eq(user.id)
    end
    

  end

  

end
