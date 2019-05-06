class RemoveDescriptionAndTimelineFromGoals < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :description, :string
    remove_column :goals, :timeline, :datetime
  end
end
