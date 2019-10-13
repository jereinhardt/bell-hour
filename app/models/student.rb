class Student < ApplicationRecord

  belongs_to :school
  belongs_to :department
  belongs_to :dismissal_type
  belongs_to :teacher, class_name: :User, foreign_key: "user_id"
  belongs_to :with_teacher, class_name: :User, foreign_key: "with_teacher_id", optional: true

  include PgSearch
  pg_search_scope :search_by_name,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  scope :with_teacher, -> (teacher_user) {
    where(present: true).where(with_teacher: teacher_user)
  }
  scope :away_from_teacher, -> (teacher_user) {
    where(present: true).where.not(with_teacher: teacher_user)
  }
  scope :visiting_teacher, -> (teacher_user) {
    where(present: true).
      where(with_teacher: teacher_user).
      where.not(teacher: teacher_user)
  }
  scope :absent, -> { where(present: false) }

  def self.by_dismissal_type
    all.group_by { |student| student.dismissal_type.name }
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
