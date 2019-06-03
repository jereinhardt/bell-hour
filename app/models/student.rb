class Student < ApplicationRecord
  belongs_to :teacher, class_name: :User, foreign_key: "teacher_id"
  belongs_to :guardian, class_name: :User, foreign_key: "guardian_id"
  belongs_to :with_teacher, class_name: :User, foreign_key: "with_teacher_id"

end
