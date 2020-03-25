class CreateCleaners < ActiveRecord::Migration[5.2]
  def change
    create_table :cleaners do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
