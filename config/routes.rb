Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope :manage do
    get :login, to: 'users#new_admin_session', as: :new_admin_session
    post :login, to: 'users#create_admin_session', as: :create_admin_session
    delete :logout, to: 'users#destroy_admin_session', as: :destroy_admin_session
  end

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

  root to: 'customer/homes#top'
  get '/about', to: 'customer/homes#about'

  resources :orders, module: :customer, only: [:new, :create, :index, :show]
  post '/orders/confirm', to: 'customer/orders#confirm'
  get '/orders/thanks', to: 'customer/orders#thanks'

  resources :products, module: :customer, only: [:index, :show] do
    resources :favorite_products, only: [:create, :destroy]
  end

  resources :recipes, module: :customer, only: [:index, :show] do
    resources :favorite_recipes, only: [:create, :destroy]
    resources :recipe_comments, only: [:create, :destroy]
  end

  delete '/cart_products/destroy_all', to: 'customer/cart_products#destroy_all'
  resources :cart_products, module: :customer, only: [:index, :update, :destroy]
  post '/cart_products', to: 'customer/cart_products#create',  as: 'create_cart_products'

  resources :customers, module: :customer, only: [:show, :edit, :update]
  get '/my_page', to: 'customer/customers#show'
  get '/customers/:id/unsubscribe', to: 'customer/customers#unsubscribe', as: 'customer_unsubscribe'
  patch '/customers/withdraw', to: 'customer/customers#withdraw'
  
  resources :messages, module: :customer, only: [:index, :show, :create]
  
  get "search" => "customer/searches#search"
  
  resources :messages, module: :customer, only: [:show, :create]
  
  get "search" => "customer/searches#search"
  
  resources :favorites, module: :customer, only: [:index]

  resources :notifications, module: :customer, only: [:index, :update]
  
  resources :producers, module: :customer, only: [:show]


  namespace :producer do
    root to: 'homes#top'
    get '/about', to: 'homes#about'

    resources :producers, only: [:edit, :update]
    get '/my_page', to: 'producers#show'
    get '/:id/my_page', to: 'producers#unsubscribe', as: 'unsubscribe'
    patch '/withdraw', to: 'producers#withdraw'

    resources :products

    resources :recipes, only: [:new, :create, :index, :show, :destroy, :update]
    get '/edit_recipe_detail/:id', to: 'recipes#edit_recipe_detail', as: 'edit_recipe_detail'
    get '/edit_recipe/:id', to: 'recipes#edit_recipe_introduction', as: 'edit_recipe_introduction'


    resources :ingredients, only: [:create, :destroy]

    resources :recipe_details, only: [:create, :destroy]

    resources :orders, only: [:show, :update] do
      patch '/order_details/:id', to: 'order_details#update', as: 'details'
    end
    
    resources :messages, only: [:index, :show, :create]
    
    resources :messages, only: [:index, :show, :create]
    
    resources :notifications, only: [:index, :update]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
