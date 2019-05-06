class Goal < ApplicationRecord
  belongs_to :user
  has_many :steps
  has_many :goal_categories
  has_many :categories, through: :goal_categories
  has_many :likes
  has_many :users, through: :likes
end
