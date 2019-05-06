class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :description
      t.datetime :timeline
      t.integer :user_id

      t.timestamps
    end
  end
end
