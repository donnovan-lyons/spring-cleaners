Rails.application.routes.draw do
  resources :users
  resources :appointments
  resources :customers
  resources :cleaners
  resources :sessions
  root to: 'welcome#homepage'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  # post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
