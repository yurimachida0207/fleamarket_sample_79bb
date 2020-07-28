Rails.application.routes.draw do
  resources :login, only: [:index, :new]
  root 'items#index'
end
