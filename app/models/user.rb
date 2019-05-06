class User < ApplicationRecord
  has_many :likes
  has_many :goals, through: :likes

  validates :username, presence: true, uniqueness: { case_sensitive: false}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
