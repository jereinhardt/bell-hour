class NotificationsController < ApplicationController

  def index
    @notifications = policy_scope(Notification)

    respond_to do |format|
      format.js
    end
  end

  def update
    @notifications = policy_scope(Notification)
    authorize(@notifications)
    @notifications.update_all(read_at: Time.zone.now)

    respond_to do |format|
      format.js
    end
  end
end
