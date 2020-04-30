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
      get 'purchased'
      get 'buy'
    end
  end
  
  resources :users
  resources :categories, onlu: :index
  resources :credit_cards
end

