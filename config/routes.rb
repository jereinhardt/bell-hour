Rails.application.routes.draw do
  root to: 'departments#index'

  resources :conversations, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  devise_for :users

  resources :school, only: [] do
    resources :departments, only: [:new, :create]
    resources :dismissal_types, only: [:new, :create]
    resources :users, only: [:new, :create, :show]
    resources :user_candidates, only: [:new, :create]
    resources :students, only: [:new, :create]
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

  resources :students, only: [:index, :show, :edit, :update, :destroy] do
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

  resources :notifications, only: [:index]
  resource :notifications, only: [:update]
end
