class CreatePickups < ActiveRecord::Migration[7.0]
  def change
    create_table :pickups do |t|
      t.text :address
      t.text :address_2
      t.text :city
      t.text :state
      t.text :zip_code
      t.text :status
      t.timestamps
      t.references :equipment, foreign_key: true
    end
  end
end
