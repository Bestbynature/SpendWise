require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@example.com', password: 'password123')
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(email: nil, password: 'password123')
    expect(user).not_to be_valid
  end

  it 'is not valid without a password' do
    user = User.new(email: 'test@example.com', password: nil)
    expect(user).not_to be_valid
  end

  it 'should have a unique email' do
    User.create(email: 'test@example.com', password: 'password123')
    user = User.new(email: 'test@example.com', password: 'another_password')
    expect(user).not_to be_valid
  end

  it 'should be valid with a password longer than 6 characters' do
    user = User.new(email: 'test@example.com', password: 'pass123')
    expect(user).to be_valid
  end

  it 'should not be valid with a password shorter than 6 characters' do
    user = User.new(email: 'test@example.com', password: 'pass')
    expect(user).not_to be_valid
  end
end
