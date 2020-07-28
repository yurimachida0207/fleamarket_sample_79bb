Rails.application.routes.draw do
  get 'new_member#index'
  root 'toppages#index'
  get "transactions/buy"
  get "mypages/index"
  get "mypages/logout"
  get "mypages/payment"
end
