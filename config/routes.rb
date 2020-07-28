Rails.application.routes.draw do
  root 'toppages#index'
  get "transactions/buy"
  get "mypages/index"
  get "mypages/logout"
  get "mypages/payment"
end
