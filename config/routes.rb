Rails.application.routes.draw do
  get 'doctors/profile'
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
  
  get 'appointments/:id/new_recomendation', to: "appointments#new_recomendation"
  patch 'appointments/:id/create_recomendation', to: "appointments#create_recomendation"

  root 'cutaway#index'
end
