class GoalCategory < ApplicationRecord
  belongs_to :goal
  belongs_to :category 
end
