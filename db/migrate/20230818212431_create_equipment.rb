class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|

      t.text :serial_number
      t.text :manufacturer
      t.text :model
      t.timestamps
    end
  end
end
