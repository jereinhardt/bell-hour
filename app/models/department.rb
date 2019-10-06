class Department < ApplicationRecord
  belongs_to :school
  has_many :users
  has_many :user_candidates
  has_many :students

  scope :with_user_candidates, -> { joins(:user_candidates) }
  scope :grades_first, -> { order(grade: :desc) }
end
