require 'rails_helper'

RSpec.describe ProductsController, type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group, user:) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get new_group_product_path(group)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:product_params) do
      {
        product: {
          name: 'Example Product',
          amount: 100,
          author_id: user.id,
          group_ids: [group.id]
        }
      }
    end

    it 'redirects to the group show page after successful creation' do
      post group_products_path(group), params: product_params
      expect(response).to redirect_to(group_path(group))
      expect(flash[:notice]).to be_present
    end

    it 'redirects back to the new product page with an alert when no products were created' do
      product_params[:product][:name] = ''
      expect do
        post group_products_path(group), params: product_params
      end.not_to change(Product, :count)

      expect(response).to redirect_to(new_group_product_path(group))
      expect(flash[:alert]).to be_present
    end
  end
end
