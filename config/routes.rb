Rails.application.routes.draw do
  root to: 'welcome#homepage'
  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  # get '/auth/facebook/callback' => 'sessions#create_with_facebook'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'cleaners/:cleaner_id/appointments/new', to: 'appointments#cleaner_new', as: 'new_cleaner_appointment'
  post 'cleaners/:cleaner_id/appointments', to: 'appointments#cleaner_create'
  get 'cleaners/:cleaner_id/appointments', to: 'appointments#cleaner_index', as: 'cleaner_appointments'
  patch 'cleaners/:cleaner_id/appointments', to: 'appointments#cleaner_update'
  delete 'cleaners/:cleaner_id/appointments/:id', to: 'appointments#cleaner_destroy', as: 'cleaner_appointment'
  get 'cleaners/:cleaner_id/appointments/completed', to: 'appointments#cleaner_completed', as: 'cleaner_completed_appts'
  resources :users, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :cleaners, only: [:new, :create, :show] 
  resources :customers, only: [:new, :create, :show] do
    resources :appointments, shallow: true
  end
  resources :conversations do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end