class Goal < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  has_many :steps
  has_many :goal_categories
  has_many :categories, through: :goal_categories

  accepts_nested_attributes_for :likes

  validates :title, presence: true, uniqueness: {case_sensitive: false}

  def title=(title)
    super(title.titleize)
  end

  #class methods

  def self.all_by_likes
    self.all.sort_by { |goal| goal.likes.length }.reverse
  end
end
