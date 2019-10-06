class UserCreation
  def initialize(user_candidate, params = {})
    @user_candidate = user_candidate
    @user_params = params
  end

  attr_reader :user

  def perform
    @user = User.new(merged_params)
    if user.save
      user_candidate.update(user: user)
      true
    else
      false
    end
  end

  private

  attr_reader :user_candidate, :user_params

  def merged_params
    if user_candidate.present?
      user_params.merge(
        teacher: user_candidate.teacher,
        admin: user_candidate.admin
      )
    else
      user_params
    end
  end
end