Rails.application.routes.draw do
  resources :new_member, only: :index
  root 'new_member#index'
  # get 'items#index'
end
