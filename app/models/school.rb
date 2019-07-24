class School < ApplicationRecord
  has_many :departments
  has_many :dismissal_types
  has_many :users
  has_many :students
end
