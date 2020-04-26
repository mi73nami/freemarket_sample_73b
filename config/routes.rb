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
  end
  
  resources :users
  resources :categories, onlu: :index

  get 'purchase', to: 'products#purchase'
end

