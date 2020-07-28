Rails.application.routes.draw do
  resources :login, only: [:index, :new]
  root 'items#index'
  root 'toppages#index'
  get "transactions/buy"
  get "mypages/index"
  get "mypages/logout"
  get "mypages/payment"
end
