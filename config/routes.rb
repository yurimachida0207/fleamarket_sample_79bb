Rails.application.routes.draw do

  # resources :items do
  #   resources :comments,  only: [:create, :destroy]
  #   resources :favorites, only: [:create, :destroy]
  #   collection do
  #     get 'get_category_children', defaults: { fomat: 'json'}
  #     get 'get_category_grandchildren', defaults: { fomat: 'json'}
  #     get 'search'
  #     get 'post_done'
  #     get 'delete_done'
  #     get 'detail_search'
  #     get 'update_done' # これを追加
  #   end
  # end
  

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end

  root 'toppages#index'

  resources :transactions do
    get 'buy', to:'card#show'
  end

  resources :mypages do
    collection do
      get 'index'
      get 'logout'
      get 'payment'
      get 'edit'
      get 'update'
    end
  end

  resources :login, only: [:index, :new]
  resources :toppages, only: :index
  resources :show_items,only: :index
  resources :items, only: [:index, :new, :edit, :update, :show]


end
