Rails.application.routes.draw do
  
  root 'toppages#index'
  resources :toppages,only: :index
  resources :new_member, only: :index
  resources :toppages, only: :index
  resources :transactions, only: :index
  resources :mypages, only: :index

  get "new_member/index"
  get "transactions/buy"
  get "mypages/index"
  get "mypages/logout"
  get "mypages/payment"

end
