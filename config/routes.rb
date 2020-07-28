Rails.application.routes.draw do
  
  root 'toppages#index'
  resources :login, only: [:index, :new]
  resources :toppages,only: :index
  resources :new_member, only: :index
  resources :toppages, only: :index
  resources :transactions, only: :index
  resources :mypages, only: :index

end
