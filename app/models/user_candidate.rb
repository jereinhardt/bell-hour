class UserCandidate < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: Devise::email_regexp }
  before_create :generate_uuid

  belongs_to :school
  belongs_to :department
  belongs_to :user, optional: true

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid unless self.uuid.present?
  end
end
