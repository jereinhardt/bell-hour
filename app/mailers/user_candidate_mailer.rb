class UserCandidateMailer < ApplicationMailer

  def send_invitation(user_candidate, admin_user)
    @user_candidate = user_candidate
    @admin_user = admin_user
    
    mail(
      to: user_candidate.email,
      from: %("Bell Hour" <hello@bellhour.com>),
      subject: t(".subject", name: admin_user.full_name)
    )
  end
end
