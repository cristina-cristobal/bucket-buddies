class Like < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :steps, dependent: :destroy

  accepts_nested_attributes_for :steps

  delegate :title, to: :goal
  delegate :username, to: :user

  validates :goal_id, uniqueness: {scope: :user_id}


  def display_count
    "#{self.steps.length} #{"step".pluralize(self.steps.length)}"
  end

  def stringify_timeline
    if self.timeline.nil?
      "Before I die"
    else
      self.timeline.strftime("%B %e, %Y")
    end
  end


end
