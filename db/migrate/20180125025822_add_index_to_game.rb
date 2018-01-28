class AddIndexToGame < ActiveRecord::Migration[5.1]
  def change
      add_index :games, :creator_id
  end
end
