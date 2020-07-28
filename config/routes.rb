Rails.application.routes.draw do

  get "transactions/buy"
  get "mypages/index"
  get "mypages/logout"
  get "mypages/payment"

  root 'toppages#index'

  resources :login, only: [:index, :new]
  resources :toppages,only: :index
  resources :new_member, only: :index
  resources :toppages, only: :index
  resources :transactions, only: :index
  resources :show_items,only: :index

end
