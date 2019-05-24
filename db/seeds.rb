require 'faker'

p 'Creating Staff and Student body of school'

grade_id = 1
prefixes = ['Mr. ', 'Ms. ', 'Mrs. ']

6.times do
  3.times do
    teacher = Teacher.new(
      name: prefixes.sample + Faker::Name.last_name,
      grade_id: grade_id
    )
    teacher.save!
    25.times do
      student = Student.new(
        name: Faker::Name.first_name + " " + Faker::Name.last_name,
        teacher_id: teacher.id
      )
      student.save!
    end
  end
  grade_id += 1
end


p 'Task completed!'

