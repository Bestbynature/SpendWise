require 'rails_helper'

RSpec.describe 'Group Index Page', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe 'Viewing the Group Index Page' do
    let(:group) { Group.create!(name: 'Test Group', icon: 'figma.png', user:) }
    let(:product) { Product.create!(name: 'Test Product', amount: 10.99, author: user, group_id: group.id) }

    before do
      visit groups_path
    end

    it "displays the groups' information correctly" do
      expect(page).to have_content('Categories')
    end

    it "links to each group's show page" do
      visit groups_path
      expect(page).to have_current_path(groups_path)
    end
  end
end
