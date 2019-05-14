Rails.application.routes.draw do
  get 'students/index'
  get 'students/show'
  get 'teachers/index'
  get 'teachers/show'
  get 'grades/index'
  get 'grades/show'
  get 'schools/grades'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
