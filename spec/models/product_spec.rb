require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }

  it 'is valid with valid attributes' do
    product = Product.new(name: 'Example Product', amount: 10, author_id: user.id, group_id: group.id)
    expect(product).to be_valid
  end

  it 'is not valid without a name' do
    product = Product.new(name: nil, amount: 10, author_id: user.id)
    expect(product).not_to be_valid
  end

  it 'is not valid without an amount' do
    product = Product.new(name: 'Example Product', amount: nil, author_id: user.id)
    expect(product).not_to be_valid
  end

  it 'is not valid with a non-positive amount' do
    product = Product.new(name: 'Example Product', amount: -5, author_id: user.id)
    expect(product).not_to be_valid
  end

  it 'is not valid without an author_id' do
    product = Product.new(name: 'Example Product', amount: 10, author_id: nil)
    expect(product).not_to be_valid
  end

  it 'is not valid without a group_id' do
    product = Product.new(name: 'Example Product', amount: 10, author_id: user.id, group_id: nil)
    expect(product).not_to be_valid
  end

  it 'should belong to an author (user)' do
    association = Product.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
    expect(association.options[:class_name]).to eq('User')
    expect(association.options[:foreign_key]).to eq(:author_id)
  end

  it 'should have many group_products' do
    association = Product.reflect_on_association(:group_products)
    expect(association.macro).to eq(:has_many)
  end

  it 'should have many groups through group_products' do
    association = Product.reflect_on_association(:groups)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:through]).to eq(:group_products)
  end

  it 'should destroy associated group_products when deleted' do
    product = FactoryBot.create(:product, author: user, group_id: group.id)

    expect { product.destroy }.to change(GroupProduct, :count).by(0)
  end
end
