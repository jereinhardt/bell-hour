require 'faker'

p 'Seeding database...'

school = School.create!({name: "Le Wagon Elementary"})

grades = ["Kindergarten", "1st", "2nd", "3rd", "4th", "5th"]

bus = DismissalType.create!({name:"Bus rider", school_id: school.id})
car = DismissalType.create!({name:"Car rider", school_id: school.id})
walker = DismissalType.create!({name:"Walker", school_id: school.id})
after_school = DismissalType.create!({name:"Link", school_id: school.id})

dismissal_types = [bus.id, car.id, walker.id, after_school.id]

teacher_email = 0

prefix = ["Mr. ", "Ms. ", "Mrs. "]

grades.each do |grade_name|
  grade = Department.create!({name: "#{grade_name}", grade: true, school_id: school.id})

  3.times do
    faker_last_name = Faker::Name.last_name
    teacher = User.create!({
      first_name: Faker::Name.first_name,
      last_name: faker_last_name,
      teacher_name: "#{prefix.sample + faker_last_name}",
      username: Faker::Internet.username,
      email: "teacher#{teacher_email}@lewagon.com",
      password: "password",
      photo: Faker::Avatar.image,
      admin: false,
      teacher: true,
      school_id: school.id,
      department_id: grade.id
    })
    teacher_email += 1

    15.times do
      Student.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        photo: Faker::Avatar.image,
        dismissal_type_id: dismissal_types.sample,
        school_id: school.id,
        department_id: grade.id,
        present: true,
        user_id: teacher.id,
        with_teacher_id: teacher.id,
        previously_with_id: teacher.id
      })
    end
  end
end

clinic = Department.create!({name: "Clinic", grade: false, school_id: school.id})

library = Department.create!({name: "Library", grade: false, school_id: school.id})

music = Department.create!({name: "Music", grade: false, school_id: school.id})

art = Department.create!({name: "Art", grade: false, school_id: school.id})

gym = Department.create!({name: "Gym", grade: false, school_id: school.id})

office = Department.create!({name: "Office", grade: false, school_id: school.id})

faker_last_name = Faker::Name.last_name
User.create!({
  first_name: Faker::Name.first_name,
  last_name: faker_last_name,
  teacher_name: "#{prefix.sample + faker_last_name}",
  username: Faker::Internet.username,
  email: "nurse@lewagon.com",
  password: "password",
  photo: Faker::Avatar.image,
  admin: false,
  teacher: true,
  school_id: school.id,
  department_id: clinic.id
})

librarian_email = 1

2.times do
  faker_last_name = Faker::Name.last_name
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: faker_last_name,
    teacher_name: "#{prefix.sample + faker_last_name}",
    username: Faker::Internet.username,
    email: "librarian#{librarian_email}@lewagon.com",
    password: "password",
    photo: Faker::Avatar.image,
    admin: false,
    teacher: true,
    school_id: school.id,
    department_id: library.id
  })
  librarian_email += 1
end

faker_last_name = Faker::Name.last_name
User.create!({
  first_name: Faker::Name.first_name,
  last_name: faker_last_name,
  teacher_name: "#{prefix.sample + faker_last_name}",
  username: Faker::Internet.username,
  email: "musicteacher@lewagon.com",
  password: "password",
  photo: Faker::Avatar.image,
  admin: false,
  teacher: true,
  school_id: school.id,
  department_id: music.id
})

faker_last_name = Faker::Name.last_name
User.create!({
  first_name: Faker::Name.first_name,
  last_name: faker_last_name,
  teacher_name: "#{prefix.sample + faker_last_name}",
  username: Faker::Internet.username,
  email: "artteacher@lewagon.com",
  password: "password",
  photo: Faker::Avatar.image,
  admin: false,
  teacher: true,
  school_id: school.id,
  department_id: art.id
})

faker_last_name = Faker::Name.last_name
User.create!({
  first_name: Faker::Name.first_name,
  last_name: faker_last_name,
  teacher_name: "#{prefix.sample + faker_last_name}",
  username: Faker::Internet.username,
  email: "gymteacher@lewagon.com",
  password: "password",
  photo: Faker::Avatar.image,
  admin: false,
  teacher: true,
  school_id: school.id,
  department_id: gym.id
})

admin_email = 1

2.times do
  faker_last_name = Faker::Name.last_name
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: faker_last_name,
    teacher_name: "#{prefix.sample + faker_last_name}",
    username: Faker::Internet.username,
    email: "admin#{admin_email}@lewagon.com",
    password: "password",
    photo: Faker::Avatar.image,
    admin: true,
    teacher: false,
    school_id: school.id,
    department_id: office.id
  })
  admin_email += 1
end

(0..2).each do |i|
  user_1 = User.offset(i).first
  user_2 =
    if i == 0
      User.second
    elsif i == 1
      User.third
    else
      User.first
    end
  conversation = Conversation.create!({users: [user_1, user_2]})
  conversation.messages.create!(sender: user_1, body: "First message")
  conversation.messages.create!(sender: user_2, body: "Second message")
end


p 'Task completed!'

