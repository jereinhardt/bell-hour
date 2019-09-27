class User < ApplicationRecord
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

end
