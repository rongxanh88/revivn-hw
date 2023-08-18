class EquipmentSerializer < Blueprinter::Base
  identifier :id

  field :manufacturer
  field :model
  field :serial_number
end
