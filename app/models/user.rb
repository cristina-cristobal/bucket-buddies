class User < ApplicationRecord
  has_secure_password
  has_many :likes
  has_many :goals, through: :likes
  has_many :steps, through: :likes

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  
end
