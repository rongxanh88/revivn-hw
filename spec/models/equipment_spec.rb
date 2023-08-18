require 'rails_helper'

RSpec.describe Equipment, type: :model do
  context 'relationships' do
    it { should have_one(:pickup) }
  end
end
