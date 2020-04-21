class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :time_slot
      t.text :details
      t.integer :cleaner_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
