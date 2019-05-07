class AddEndTimeToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :end_time, :datetime
    rename_column :steps, :date_time, :start_time
  end
end
