Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :users, only: [:index, :show]

  namespace :admin do
    resources :courses
  end

  resources :courses, only: [:index, :show]
end
