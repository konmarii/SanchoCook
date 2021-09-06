Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :producers, controllers: {
  sessions:      'producers/sessions',
  passwords:     'producers/passwords',
  registrations: 'producers/registrations'
  }

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }
  
  ActiveAdmin.routes(self)

  root to: 'customer/homes#top'
  get '/about', to: 'customer/homes#about'

  resources :orders, module: :customer, only: [:new, :create, :index, :show]
  post '/orders/confirm', to: 'customer/orders#confirm'
  get '/orders/thanks', to: 'customer/orders#thanks'

  resources :products, module: :customer, only: [:index, :show]

  resources :recipes, module: :customer, only: [:show]

  delete '/cart_products/destroy_all', to: 'customer/cart_products#destroy_all'
  resources :cart_products, module: :customer, only: [:index, :update, :destroy, :create]

  resources :customers, module: :customer, only: [:show, :edit, :update]
  get '/customers/my_page', to: 'customer/customers#show'
  get '/customers/:id/my_page', to: 'customer/customers#unsubscribe'
  patch '/customers/withdraw', to: 'customer/customers#withdraw'

  namespace :producer do
    root to: 'homes#top'
    resources :products
    resources :recipes
    resources :ingredients, only: [:edit, :create, :update, :destroy]
    resources :recipe_details, only: [:edit, :create, :update, :destroy]
    resources :orders, only: [:index, :show, :new, :update]
    resources :order_details, only: [:update]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers
    resources :producers
    resources :genres
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
