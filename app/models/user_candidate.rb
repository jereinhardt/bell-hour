class UserCandidate < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: Devise::email_regexp }
  before_create :generate_uuid

  belongs_to :school
  belongs_to :department
  belongs_to :user, optional: true

  private

  def generate_uuid
    unless self.uuid.present?
      self.uuid = SecureRandom.urlsafe_base64
    end
  end
end
