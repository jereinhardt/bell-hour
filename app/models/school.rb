class School < ApplicationRecord
  has_many :departments
  has_many :dismissal_types
end
