class Pickup < ApplicationRecord
  STATUS_VALUES = %w[submitted pickup_pending completed]
  enum status: STATUS_VALUES.index_by(&:to_sym)

  belongs_to :equipment
end
