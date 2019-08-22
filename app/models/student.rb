class Student < ApplicationRecord

  belongs_to :school
  belongs_to :department
  belongs_to :dismissal_type
  belongs_to :teacher, class_name: :User, foreign_key: "user_id"
  belongs_to :with_teacher, class_name: :User, foreign_key: "with_teacher_id"
  belongs_to :previously_with, class_name: :User, foreign_key: "previously_with_id"

  include PgSearch
  pg_search_scope :search_by_name,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
