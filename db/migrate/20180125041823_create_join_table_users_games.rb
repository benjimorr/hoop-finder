class CreateJoinTableUsersGames < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :games do |t|
      t.index :user_id
      t.index :game_id
    end
  end
end
