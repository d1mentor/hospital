Rails.application.routes.draw do
  namespace :admin do
    resources :superusers
    resources :doctors
    resources :users
    resources :appointments
    resources :categories

    root to: 'superusers#index'
  end

  devise_for :superusers
  devise_for :doctors
  devise_for :users

  get 'users/doctors_list'
  get 'users/profile'
  get 'cutaway/index'

  resources :appointments

  root 'cutaway#index'
end
