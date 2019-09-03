class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :school
  belongs_to :department
  has_many :students
  has_many :notifications, foreign_key: :recipient_id
  #update this shit...
  has_many :students_with, foreign_key: :with_teacher_id
end
