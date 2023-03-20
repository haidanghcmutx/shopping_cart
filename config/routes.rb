Rails.application.routes.draw do
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
    resources :books
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
end
