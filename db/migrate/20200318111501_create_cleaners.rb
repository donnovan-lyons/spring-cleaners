class CreateCleaners < ActiveRecord::Migration[5.2]
  def change
    create_table :cleaners do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :whatsapp
      t.hstore :address
      t.integer :user_id
      t.integer :institution_id

      t.timestamps
    end
  end
end
