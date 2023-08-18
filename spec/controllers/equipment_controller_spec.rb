# frozen_string_literal: true

require 'rails_helper'

describe PickupsController, type: :request do
  let(:body) { JSON.parse(response.body) }

  describe '#index' do
    let!(:equipment) { create_list(:equipment, 3) }

    it 'returns all pickups and their status values' do
      get "/equipment"

      expect(response).to have_http_status(:ok)
    end
  end
end
