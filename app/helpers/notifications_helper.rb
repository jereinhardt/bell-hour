module NotificationsHelper
  def notification_text(notification)
    [
      notification.faculty.teacher_name,
      notification.action,
      notification.notifiable.first_name,
      notification.notifiable.last_name
    ].join(" ")
  end
end
