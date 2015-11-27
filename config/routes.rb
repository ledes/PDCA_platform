Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :users, only: [:index, :show]

  namespace :admin do
    resources :courses do
      resources :lessons, except: [:index]
      resources :quizzes, except: [:index]
    end
  end

  resources :courses, only: [:index, :show] do
    resources :lessons, only: [:show]
  end
end
