#rspec ./spec/model/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { User.new(name: 'Tom', email: 'edahigure@gmail.com', password: 'asddsa',role: 'user')}

  before { subject.save }

  it 'posts_counter should be integer greater than zero' do
    expect(subject).to be_valid
  end

end
