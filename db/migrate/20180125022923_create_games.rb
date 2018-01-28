class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :date
      t.references :court, foreign_key: true
      t.integer :creator_id, foreign_key: true

      t.timestamps null: false
    end

    add_index :games, :id, unique: true
  end
end
