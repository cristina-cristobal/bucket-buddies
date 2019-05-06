class Category < ApplicationRecord
  has_many :goal_categories
  has_many :goals, through: :goal_categories 
end
