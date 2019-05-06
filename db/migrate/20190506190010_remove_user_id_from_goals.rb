class RemoveUserIdFromGoals < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :user_id, :integer
  end
end
