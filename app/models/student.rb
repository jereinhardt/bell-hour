class Student < ApplicationRecord
  belongs_to :teacher, class_name: :User, foreign_key: "user_id"
  belongs_to :guardian, class_name: :User, foreign_key: "guardian_id"
  belongs_to :with_teacher, class_name: :User, foreign_key: "with_teacher_id"
  belongs_to :previously_with, class_name: :User, foreign_key: "previously_with_id"
end
