Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :users, only: [:index, :show]

  namespace :admin do

  end

  namespace :app do
  end

  resources :courses
end
