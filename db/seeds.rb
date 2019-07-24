require 'faker'

p 'Seeding database...'

school = School.create!({name: "Le Wagon Elementary"})

parents_department = Department.create!({name: "parents", grade: false, school_id: school.id, parents_department: true})

grades = ["Kindergarten", "1st", "2nd", "3rd", "4th", "5th"]

bus = DismissalType.create!({name:"bus rider", school_id: school.id})
car = DismissalType.create!({name:"car rider", school_id: school.id})
walker = DismissalType.create!({name:"walker", school_id: school.id})
after_school = DismissalType.create!({name:"after school", school_id: school.id})

dismissal_types = [bus.id, car.id, walker.id, after_school.id]

teacher_email = 0

prefix = ["Mr. ", "Ms. ", "Mrs. "]

parent_email = 0

grades.each do |grade_name|
  grade = Department.create!({name: "#{grade_name}", grade: true, school_id: school.id, parents_department: false})

  3.times do
    faker_last_name = Faker::Name.last_name
    teacher = User.create!({
      first_name: Faker::Name.first_name,
      last_name: faker_last_name,
      teacher_name: "#{prefix.sample + faker_last_name}",
      username: Faker::Internet.username,
      email: "teacher#{teacher_email}@lewagon.com",
      password: "password",
      photo: " ",
      admin: false,
      guardian: false,
      teacher: true,
      school_id: school.id,
      department_id: grade.id
    })
    teacher_email += 1

    15.times do
      parent = User.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.username,
        email: "parent#{parent_email}@parents.com",
        password: "password",
        photo: " ",
        admin: false,
        guardian: true,
        teacher: false,
        school_id: school.id,
        department_id: parents_department.id
      })

      parent_email += 1

      Student.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        photo: " ",
        dismissal_type_id: dismissal_types.sample,
        school_id: school.id,
        department_id: grade.id,
        present: true,
        user_id: teacher.id,
        with_teacher_id: teacher.id,
        guardian_id: parent.id,
        previously_with_id: teacher.id
      })

    end
  end
end

clinic = Department.create!({name: "Clinic", grade: false, school_id: school.id, parents_department: false})

library = Department.create!({name: "Library", grade: false, school_id: school.id, parents_department: false})

music = Department.create!({name: "Music", grade: false, school_id: school.id, parents_department: false})

art = Department.create!({name: "Art", grade: false, school_id: school.id, parents_department: false})

gym = Department.create!({name: "Gym", grade: false, school_id: school.id, parents_department: false})

office = Department.create!({name: "Office", grade: false, school_id: school.id, parents_department: false})

faker_last_name = Faker::Name.last_name
User.create!({
  first_name: Faker::Name.first_name,
  last_name: faker_last_name,
  teacher_name: "#{prefix.sample + faker_last_name}",
  username: Faker::Internet.username,
  email: "nurse@lewagon.com",
  password: "password",
  photo: " ",
  admin: false,
  guardian: false,
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
    photo: " ",
    admin: false,
    guardian: false,
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
  photo: " ",
  admin: false,
  guardian: false,
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
  photo: " ",
  admin: false,
  guardian: false,
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
  photo: " ",
  admin: false,
  guardian: false,
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
    photo: " ",
    admin: true,
    guardian: false,
    teacher: false,
    school_id: school.id,
    department_id: office.id
  })
  admin_email += 1
end

p 'Task completed!'

