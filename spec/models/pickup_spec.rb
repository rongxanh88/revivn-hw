require 'rails_helper'

RSpec.describe Pickup, type: :model do
  context 'status' do

    it { expect(build(:pickup, status: 'submitted').valid?).to be_truthy }
    it { expect(build(:pickup, status: 'pickup_pending').valid?).to be_truthy }
    it { expect(build(:pickup, status: 'completed').valid?).to be_truthy }
    it { expect { build(:pickup, status: 'other') }.to raise_error(ArgumentError) }
  end

  context 'relationships' do
    it { should belong_to(:equipment) }
  end
end
