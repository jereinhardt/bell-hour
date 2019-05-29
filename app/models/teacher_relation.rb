class TeacherRelation < ApplicationRecord
  belongs_to :user
  belongs_to :student
end
