Rails.application.routes.draw do
  root to: 'departments#index'

  devise_for :users

  resources :school, only: [] do
    resources :departments, only: [:new, :create]
    resources :dismissal_types, only: [:new, :create]
    resources :users, only: [:new, :create]
  end

  resources :departments, only: [:index, :show, :edit, :update, :destroy] do
    resources :users, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      patch :give_class_to
      patch :take_back_class
    end
    resources :students, only: [] do
      member do
        patch :send_to_teacher
      end
    end
  end

  resources :students, only: [:index, :show] do
    member do
      patch :take
      patch :dismiss
      patch :mark_present
    end
    collection do
      put :take_attendance
    end
  end

  resources :dismissal_types, only: [:edit, :update, :destroy] do
    member do
      patch :dismiss_type_with
    end
  end

  # [...]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :notifications, only: [ :index ] do
        collection do
          post :mark_as_read
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
