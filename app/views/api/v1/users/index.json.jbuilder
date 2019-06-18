json.array! @users do |user|
  json.extract! user, :teacher_name
end
