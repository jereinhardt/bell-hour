class Department < ApplicationRecord
  belongs_to :school
  has_many :users
end
