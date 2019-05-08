class Like < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :steps

  delegate :title, to: :goal

  validates :goal_id, uniqueness: {scope: :user_id}

  #convert params from date_select :timeline to DateTime
  def timeline=(params)
    super (DateTime.new(*params.values))
  end

  # def goal_title
  #   self.goal.title
  # end

  def stringify_timeline
    if self.timeline.nil?
      "Before I die"
    else
      self.timeline.strftime("%B %e, %Y")
    end
  end

end
