# frozen_string_literal: true

require 'rails_helper'

describe PickupsController, type: :request do
  let(:body) { JSON.parse(response.body) }

  describe '#index' do
    let!(:pickups) { create_list(:pickup, 3) }

    it 'returns all pickups and their status values' do
      get "/pickups"

      expect(response).to have_http_status(:ok)
      expect(body.count).to eq 3
      expect(body.first['status']).to_not be_nil
    end
  end

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
