Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'ship_addresses', to: 'users/registrations#new_address'
    post 'ship_addresses', to: 'users/registrations#create_address'
  end

  root to: "home#index"
  
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      post 'purchase'
      get 'buy'
    end
  end
  
  resources :users do
    collection do
      get :complete
    end
  end

  resources :categories, onlu: :index

  resources :credit_cards do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end

end

