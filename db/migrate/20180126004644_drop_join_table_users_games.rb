class DropJoinTableUsersGames < ActiveRecord::Migration[5.1]
  def change
      drop_join_table :users, :games
  end
end
