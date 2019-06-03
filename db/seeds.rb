require 'faker'

p 'Seeding database...'

school = School.create!({name: "Le Wagon Elementary"})

parents_department = Department.create!({name: "parents", grade: false, school_id: school.id})

grades = ["Kindergarten", "1st", "2nd", "3rd", "4th", "5th"]
teacher_email = 0

transportation = ["pickup", "walker", "bus", "after-school"]

prefix = ["Mr. ", "Ms. ", "Mrs. "]

parent_email = 0

grades.each do |grade_name|
  grade = Department.create!({name: "#{grade_name}", grade: true, school_id: school.id})

  3.times do
    faker_last_name = Faker::Name.last_name
    teacher = User.create!({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      teacher_name: "#{prefix.sample + faker_last_name}",
      username: Faker::Internet.username,
      email: "teacher#{teacher_email}@lewagon.com",
      password: "password",
      photo: " ",
      admin: false,
      guardian: false,
      teacher: true,
      department_id: grade.id
    })
    teacher_email += 1

    15.times do
      parent = User.create!({
        first_name: Faker::Name.first_name,
        last_name: faker_last_name,
        username: Faker::Internet.username,
        email: "parent#{parent_email}@parents.com",
        password: "password",
        photo: " ",
        admin: false,
        guardian: true,
        teacher: false,
        department_id: parents_department.id
      })

      parent_email += 1

      Student.create!({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        photo: " ",
        transportation_type: transportation.sample,
        present: true,
        teacher_id: teacher.id,
        with_teacher_id: teacher.id,
        guardian_id: parent.id,
        previously_with_id: teacher.id
      })

    end
  end
end

p 'Task completed!'

