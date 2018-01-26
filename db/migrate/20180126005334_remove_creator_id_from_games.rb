class RemoveCreatorIdFromGames < ActiveRecord::Migration[5.1]
  def change
      remove_index :games, :creator_id
      remove_column :games, :creator_id, :int
  end
end
