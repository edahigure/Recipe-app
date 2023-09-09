#rspec ./spec/model/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  
  let!(:user) do
    User.create(name: 'Jose', email: 'edahigure@hotmail.com',role: 'user',password: 'qweqwe')
  end

  describe 'checking atributes and validity' do

    it 'should create a valid user' do
      expect(user).to be_valid
    end
    
    it 'should give the correct name' do
      expect(user.name).to eq('Jose')
    end

    it 'should give the correct email' do
      expect(user.email).to eq('edahigure@hotmail.com')
    end

    it 'should give the correct role' do
      expect(user.role).to eq('user')
    end

    it 'has many recipes' do
      association = described_class.reflect_on_association(:recipes)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end

    it 'has many foods' do
      association = described_class.reflect_on_association(:foods)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end
  end 

  

end
