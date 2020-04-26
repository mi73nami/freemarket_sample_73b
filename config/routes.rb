Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'ship_addresses', to: 'users/registrations#new_address'
    post 'ship_addresses', to: 'users/registrations#create_address'
  end

  root to: "home#index"
  
  resources :products
  resources :users
  resources :categories, onlu: :index

  get 'purchase', to: 'products#purchase'
end

