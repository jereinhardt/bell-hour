class NotificationsController < ApplicationController

  def index
    @notifications = policy_scope(Notification)

    respond_to do |format|
      format.js
    end
  end

  def update
    notifications = policy_scope(Notification)
    cached_ids = notifications.select(:id)
    authorize(notifications)
    notifications.update_all(read_at: Time.zone.now)
    @notifications = Notification.where(id: cached_ids)

    respond_to do |format|
      format.js
    end
  end
end
