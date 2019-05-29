require 'faker'

p 'Seeding database...'

school = School.create!({name: "Le Wagon Elementary"})

fifth_grade = Department.create!({name: "5th Grade", school_id: school.id})





p 'Task completed!'

