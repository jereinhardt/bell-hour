class NotificationsController < ApplicationController

  def index
    @notifications = policy_scope(Notification)
  end

  def mark_as_read
    @notifications = policy_scope(Notification)
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
end
