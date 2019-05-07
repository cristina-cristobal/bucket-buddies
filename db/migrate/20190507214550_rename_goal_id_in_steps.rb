class RenameGoalIdInSteps < ActiveRecord::Migration[5.2]
  def change
    rename_column :steps, :goal_id, :like_id
  end
end
