class Step < ApplicationRecord
  belongs_to :like

  validates :name, presence: true

  delegate :user, to: :like

  def stringify_timeline(time)
    if time.nil?
      "Before I die"
    else
      time.strftime("%B %e, %Y at %l:%M %P")
    end
  end

end
