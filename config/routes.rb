Rails.application.routes.draw do
  root to: 'departments#index'

  devise_for :users

  resources :departments, only: [:index, :show]

  resources :users, only: [:index, :show] do
    member do
      patch :dismiss_all_bus
      patch :dismiss_all_as
      patch :dismiss_all_walker
      patch :dismiss_all_pickup
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
