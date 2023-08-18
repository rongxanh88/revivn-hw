# frozen_string_literal: true

require 'rails_helper'

describe PickupSerializer do
  let(:pickup) { create(:pickup) }

  subject(:serialized) { described_class.render_as_hash(pickup) }

  it 'serializes object to json' do
    expect(serialized[:id]).to eql(pickup.id)
    expect(serialized[:status]).to eql(pickup.status)
  end
end
