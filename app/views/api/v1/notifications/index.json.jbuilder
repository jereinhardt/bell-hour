json.array! @notifications do |notification|
  json.faculty notification.faculty.teacher_name
  json.action notification.action
  json.notifiable do
    json.type "#{notification.notifiable.first_name} #{notification.notifiable.last_name}"
    json.id notification.notifiable.id
  end
end
