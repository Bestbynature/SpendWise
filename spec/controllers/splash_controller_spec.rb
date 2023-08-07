require 'rails_helper'

RSpec.describe 'SplashController', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    context 'when user is not signed in' do
      it 'renders the index template' do
        get root_path
        expect(response).to render_template(:index)
      end

      it "displays 'SpendWise' in the response body" do
        get root_path
        expect(response.body).to include('SpendWise')
      end

      it "displays 'Log In' and 'Sign Up' links in the response body" do
        get root_path
        expect(response.body).to include('Log In')
        expect(response.body).to include('Sign Up')
      end

      it "does not display 'Log Out' link in the response body" do
        get root_path
        expect(response.body).not_to include('Log Out')
      end

      it 'does not redirect to groups_path' do
        get root_path
        expect(response).not_to redirect_to(groups_path)
      end
    end

    context 'when user is signed in' do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in user
      end

      it 'redirects to groups_path' do
        get root_path
        expect(response).to redirect_to(groups_path)
      end
    end
  end
end
