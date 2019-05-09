class Like < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :steps

  accepts_nested_attributes_for :steps

  delegate :title, to: :goal
  delegate :username, to: :user

  validates :goal_id, uniqueness: {scope: :user_id}


  #convert params from date_select :timeline to DateTime
  def timeline=(params)
    super (DateTime.new(*params.sort.to_h.values)) unless params.values.any?(nil)
  end

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
