require 'rails_helper'

RSpec.describe 'GroupsController', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'displays placeholder text in the response body' do
      get groups_path
      expect(response.body).to include('Categories')
    end

    it 'renders the correct template' do
      get groups_path
      expect(response).to render_template(:index)
    end

    it 'returns a successful response' do
      get groups_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let(:group) { FactoryBot.create(:group, user:) }

    it 'displays placeholder text in the response body' do
      get group_path(group)
      expect(response.body).to include('Transactions')
    end

    it 'renders the correct template' do
      get group_path(group)
      expect(response).to render_template(:show)
    end

    it 'returns a successful response' do
      get group_path(group)
      expect(response).to have_http_status(:success)
    end
  end
end
