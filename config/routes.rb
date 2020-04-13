Rails.application.routes.draw do
  root to: 'welcome#homepage'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  # get 'cleaners/:cleaner_id/appointments/new', to: 'appointments#cleaner_new'
  # get 'cleaners/:cleaner_id/appointments', to: 'appointments#cleaner_index'
  # get 'cleaners/:cleaner_id/appointments/:id/edit', to: 'appointments#cleaner_edit'
  resources :users, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :cleaners, only: [:new, :create, :show] 
  resources :customers, only: [:new, :create, :show] do
    resources :appointments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end