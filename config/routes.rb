Rails.application.routes.draw do

  # get 'purchase/index'
  # get 'purchase/done'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end

  root 'toppages#index'

  # resources :transactions do
  #   get 'buy', to:'card#show'
  # end

  resources :mypages do
    collection do
      get 'index'
      get 'logout'
      get 'payment'
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase do
    member do
      post 'pay', to: 'purchase#pay'
      get 'index', to: 'purchase#index'
      get 'done', to: 'purchase#done'
    end
  end

  # resources :login, only: [:index, :new]
  resources :toppages, only: :index
  resources :login, only: :new
  
  resources :items do 
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
end
