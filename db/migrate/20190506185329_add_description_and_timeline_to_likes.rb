class AddDescriptionAndTimelineToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :description, :string
    add_column :likes, :timeline, :datetime
  end
end
