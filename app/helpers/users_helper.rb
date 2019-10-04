module UsersHelper
  def department_options(departments)
    departments.map do |department|
      [department.name, department.id]
    end
  end
end
