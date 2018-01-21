class AddSkillLevelToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :skill_level, :integer
  end
end
