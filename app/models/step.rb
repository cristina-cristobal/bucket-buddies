class Step < ApplicationRecord
  belongs_to :like

  delegate :user, to: :like


end
