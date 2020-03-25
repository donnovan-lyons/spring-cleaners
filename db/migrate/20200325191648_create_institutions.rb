class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.hstore :address

      t.timestamps
    end
  end
end
