class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.hstore :address
      t.integer :user_id

      t.timestamps
    end
  end
end
