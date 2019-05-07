class AddLocationToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :location, :string
  end
end
