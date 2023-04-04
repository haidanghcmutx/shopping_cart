Rails.application.routes.draw do
  get 'order_detail/create'
  get 'order/show'
  get 'shops/new'
  get 'shops/edit'
  get 'showAll', to: 'shops#shops'
  get 'search', to: 'static_pages#search'
  devise_for :users
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'
  get 'category', to: 'static_pages#category'
  
  resources :books
  resources :shops do
    get 'order', to: 'shops#order'
    get 'bill', to: 'shops#bill'
    resources :books
  end

  resource :carts, only: [:show]
  resource :cart_details, only: %i[create update destroy]
  resources :order_detail, only: %i[create update destroy]
  resources :order, only: %i[update show export_bill] do
    get 'export_bill', to: 'order#export_bill', as: 'export_bill'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
