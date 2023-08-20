# frozen_string_literal: true

require 'rails_helper'

describe PickupSerializer do
  let(:pickup) { create(:pickup) }

  subject(:serialized) { described_class.render_as_hash(pickup) }

  it 'serializes object to json' do
    expect(serialized[:id]).to eql(pickup.id)
    expect(serialized[:address]).to eql(pickup.address)
    expect(serialized[:secondary_address]).to eql(pickup.address_2)
    expect(serialized[:city]).to eql(pickup.city)
    expect(serialized[:state]).to eql(pickup.state)
    expect(serialized[:zip_code]).to eql(pickup.zip_code)
    expect(serialized[:status]).to eql(pickup.status)
  end
end
