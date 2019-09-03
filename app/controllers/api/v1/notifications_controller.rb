class Api::V1::NotificationsController < Api::V1::BaseController
  def index
    @notifications = policy_scope(Notification)
  end

  def mark_as_read
    @notifications = policy_scope(Notification)
    @notifications.update_all(read_at: Time.zone.now)
    render josn: {success: true}
  end
end
