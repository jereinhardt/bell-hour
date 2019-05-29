class WithTeacherRelation < ApplicationRecord
  belongs_to :user
  belongs_to :student
end
