FactoryBot.define do
  factory :equipment do
    serial_number { Faker::Company.duns_number }
    manufacturer { Faker::Company.name }
    model { Faker::Device.model_name }
  end
end
