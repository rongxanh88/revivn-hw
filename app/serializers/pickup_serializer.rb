class PickupSerializer < Blueprinter::Base
  identifier :id

  field :address
  field :address_2, name: :secondary_address
  field :city
  field :state
  field :zip_code
  field :status
end
