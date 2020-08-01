Rails.application.routes.draw do
  devise_for :users
  root 'toppages#index'

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'done'
    end
  end

  resources :transactions do
    get 'buy'
  end

  resources :mypages do
    collection do
      get 'index'
      get 'logout'
      get 'payment'
      get 'show'
    end
  end

  resources :login, only: :index
  resources :toppages, only: :index
  resources :show_items, only: :index
  resources :items, only: :new

end
