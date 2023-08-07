require 'rails_helper'

RSpec.describe 'Group Show Page', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(email: 'test@example.com', password: 'password', name: 'test user') }

  before do
    sign_in user
  end

  describe 'Viewing the Group Show Page' do
    let(:group) { Group.create!(name: 'Test Group', icon: 'figma.png', user:) }
    let(:product) { Product.create!(name: 'Test Product', amount: 10.99, author: user, group_id: group.id) }

    it 'displays the group information correctly' do
      visit group_path(group)

      expect(page).to have_content(group.name)
      expect(page).to have_content(group.updated_at.strftime('%d %b %Y'))
      expect(page).to have_content("$ #{@total}")
    end

    it 'displays the associated products' do
      visit group_path(group)

      expect(page).to have_content('SCAN')
    end
  end
end
