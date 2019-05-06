class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :name
      t.string :description
      t.datetime :date_time
      t.integer :goal_id

      t.timestamps
    end
  end
end
