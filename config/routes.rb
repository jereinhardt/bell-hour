Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :departments, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :students, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
