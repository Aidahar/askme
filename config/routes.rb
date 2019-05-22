Rails.application.routes.draw do
  root 'users#index'

  resources :users, except: [:destroy]
  resource :sessions, only: [:new, :create, :destroy]
  resources :questions, except: [:show, :new, :index]
end
