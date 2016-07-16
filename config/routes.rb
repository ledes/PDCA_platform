Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  namespace :admin do
    resources :courses do
      resources :lessons, except: [:index]
      resources :quizzes, except: [:index]
    end
  end

  resources :users, only: [:index, :show]
  resources :courses, only: [:index, :show] do
    resources :lessons, only: [:show]
    resources :course_users, only: [:create]
  end
end
