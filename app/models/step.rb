class Step < ApplicationRecord
  belongs_to :like

  delegate :user, to: :like

  def stringify_timeline(time)
    if time.nil?
      "Before I die"
    else
      time.strftime("%B %e, %Y at %l:%M %P")
    end
  end

end
