Rails.application.routes.draw do
  root 'toppages#index'

  resources :transactions do
    get 'buy'
  end

  resources :mypages do
    collection do
      get 'index'
      get 'logout'
      get 'payment'
    end
  end
end
