class CreateUserGames < ActiveRecord::Migration[5.1]
  def change
    create_table :user_games do |t|
        t.references :user, index: true, foreign_key: true
        t.references :game, index: true, foreign_key: true
        t.boolean :creator, null: false, default: false

        t.timestamps null: false
    end

    add_index :user_games, :id, unique: true
  end
end
