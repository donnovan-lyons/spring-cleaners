class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.integer :house_number
      t.integer :apt_number
      t.string :neighborhood
      t.string :city
      t.string :phone
      t.integer :user_id

      t.timestamps
    end
  end
end
