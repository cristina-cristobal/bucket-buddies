class Goal < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  has_many :steps
  has_many :goal_categories
  has_many :categories, through: :goal_categories

  validates :title, presence: true, uniqueness: {case_sensitive: false}
end
