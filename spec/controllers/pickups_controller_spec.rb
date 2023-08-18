# frozen_string_literal: true

require 'rails_helper'

describe PickupsController, type: :request do
  let(:body) { JSON.parse(response.body) }

  describe '#create' do
    context 'success' do
      let(:equipment) { create(:equipment) }
      let(:pickup_params) do
        {
          address: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state
        }
      end

      it 'returns an article' do
        post "/equipment/#{equipment.id}/pickups", params: pickup_params

        expect(response).to have_http_status(:created)
        expect(body['id']).to_not be_nil
      end
    end
  end
end
