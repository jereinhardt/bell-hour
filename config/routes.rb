Rails.application.routes.draw do
  root to: 'departments#index'

  devise_for :users

  resources :departments, only: [:index, :show]

  resources :users, only: [:index, :show] do
    member do
      patch :give_class_to
      patch :take_back_class
    end
  end

  resources :students, only: [:index, :show] do
    member do
      patch :take
      patch :dismiss
      patch :mark_present
      patch :give_back
      patch :give_to_teacher
    end
  end

  resources :dismissal_types, only: [:index, :show] do
    member do
      patch :dismiss_type_with
    end
  end

  # [...]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
