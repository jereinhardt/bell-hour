class GuardianRelation < ApplicationRecord
  belongs_to :user
  belongs_to :student
end
