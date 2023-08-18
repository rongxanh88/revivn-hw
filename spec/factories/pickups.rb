FactoryBot.define do
  factory :pickup do
    equipment
    
    address { Faker::Address.street_address }
    address_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip_code { Faker::Address.zip }
    status { Pickup::STATUS_VALUES.sample }
  end
end
