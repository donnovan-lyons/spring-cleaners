Rails.application.routes.draw do
  resources :users
  resources :appointments
  resources :customers
  resources :cleaners
  root to: 'welcome#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
