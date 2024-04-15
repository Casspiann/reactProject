# spec/controllers/api/v1/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new category' do
        expect {
          post :create, params: { name: FactoryBot.build(:category).name }
        }.to change(Category, :count).by(1)
      end

      it 'returns status code 201' do
        post :create, params: { name: FactoryBot.build(:category).name }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category' do
        expect {
          post :create, params: { name: nil }
        }.to_not change(Category, :count)
      end

      it 'returns unprocessable entity status code' do
        post :create, params: { name: nil }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors in JSON response' do
        post :create, params: { name: nil }
        expect(JSON.parse(response.body)['errors']).to be_present
      end
    end
  end
end
