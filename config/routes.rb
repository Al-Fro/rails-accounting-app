Rails.application.routes.draw do
  resources :compensation_requests

  patch 'approve', to: 'compensation_requests#approve'
  root to: 'logins#new'

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'

  get 'googlelogin/create', to: 'googlelogins#create', as: :create_google_login

  resources :users
  resources :reset_passwords, only: %i[edit update]
end
