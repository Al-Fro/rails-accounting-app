Rails.application.routes.draw do
  namespace :admin do
    resources :compensation_requests, only: %i[index show udpate]
    resources :employees, only: %i[index show]
  end

  resources :compensation_requests

  root to: "logins#new"

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'

  get 'googlelogin/create', to: 'googlelogins#create', as: :create_google_login

  resources :users
end
