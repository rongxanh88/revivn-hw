# frozen_string_literal: true

require 'rails_helper'

describe EquipmentSerializer do
  let(:equipment) { create(:equipment) }

  subject(:serialized) { described_class.render_as_hash(equipment) }

  it 'serializes object to json' do
    expect(serialized[:id]).to eql(equipment.id)
    expect(serialized[:manufacturer]).to eql(equipment.manufacturer)
    expect(serialized[:model]).to eql(equipment.model)
    expect(serialized[:serial_number]).to eql(equipment.serial_number)
  end
end
