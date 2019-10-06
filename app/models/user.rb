class User < ApplicationRecord
  DEFAULT_PHOTO = 'default_profile.jpg'.freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :validatable

  belongs_to :school
  belongs_to :department
  has_many :students
  has_many :notifications, foreign_key: :recipient_id
  has_many :students_with, foreign_key: :with_teacher_id
  has_many :user_conversations
  has_many :conversations, through: :user_conversations

  def self.build_from_candidate(user_candidate)
    attributes = user_candidate.attributes.symbolize_keys.slice(
      :email,
      :first_name,
      :last_name,
      :teacher_name,
      :teacher,
      :photo,
      :department_id,
      :school_id
    )
    new(attributes)
  end

  def full_name
    [first_name, last_name].join(" ")
  end
end
