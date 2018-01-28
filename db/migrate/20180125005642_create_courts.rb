class CreateCourts < ActiveRecord::Migration[5.1]
  def change
    create_table :courts do |t|
      t.string :name
      t.integer :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.integer :zip_code
      t.float :latitude
      t.float :longitude
      t.string :google_places_id

      t.timestamps null: false
    end

    add_index :courts, :id, unique: true
  end
end
