class User < ApplicationRecord
  has_many :goals
  has_many :likes
  has_many :goals, through: :likes
end
