class CreateCleaners < ActiveRecord::Migration[5.2]
  def change
    create_table :cleaners do |t|
      t.string :first_name
      t.string :last_name
      t.string :yeshiva
      t.string :phone_number
      t.string :whatsapp
      t.integer :user_id

      t.timestamps
    end
  end
end
