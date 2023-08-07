require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'is valid with valid attributes' do
    group = Group.new(name: 'Example Group', icon: 'icon.png', user:)
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = Group.new(name: nil, icon: 'icon.png', user:)
    expect(group).not_to be_valid
  end

  it 'is not valid without a unique name within the same user' do
    Group.create(name: 'Example Group', icon: 'icon.png', user:)
    group = Group.new(name: 'Example Group', icon: 'another_icon.png', user:)
    expect(group).not_to be_valid
  end

  it 'is not valid without an icon' do
    group = Group.new(name: 'Example Group', icon: nil, user:)
    expect(group).not_to be_valid
  end

  it 'should belong to a user' do
    association = Group.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'should have many group_products' do
    association = Group.reflect_on_association(:group_products)
    expect(association.macro).to eq(:has_many)
  end

  it 'should have many products through group_products' do
    association = Group.reflect_on_association(:products)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:through]).to eq(:group_products)
  end
end
