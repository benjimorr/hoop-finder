class RemoveSkillLevelFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :skill_level, :string
  end
end
