# Preview all emails at http://localhost:3000/rails/mailers/user_candidate_mailer
class UserCandidateMailerPreview < ActionMailer::Preview
  def send_invitation
    user_candidate = find_or_create_user_candidate
    admin_user = find_or_create_admin_user
    UserCandidateMailer.send_invitation(user_candidate, admin_user)
  end

  private

  def find_or_create_user_candidate
    UserCandidate.last  || UserCandidate.create(user_candidate_params)
  end

  def find_or_create_admin_user
    User.find_by(admin: true) || User.create(admin_user_params)
  end

  def user_candidate_params
    {
      email: "candidate_user@example.com",
      teacher: true,
      school: school,
      department: school.departments.first
    }
  end

  def admin_user_params
    {
      email: "admin_user@email.com",
      password: "password",
      admin: true,
      teacher: true,
      first_name: "Rusty",
      last_name: "Shackleford",
      teacher_name: "Mr. Shackleford",
      photo: User::DEFAULT_PHOTO,
      school: school,
      department: school.departments.first
    }
  end

  def school
    School.joins(:departments).first
  end
end
