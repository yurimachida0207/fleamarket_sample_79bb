Rails.application.routes.draw do

  # root 'toppages#index'
  root 'show_items#index'

  resources :login, only: [:index, :new]
  resources :toppages,only: :index
  resources :new_member, only: :index
  resources :toppages, only: :index
  resources :transactions, only: :index
  resources :mypages, only: :index
  resources :show_items,only: :index
end
