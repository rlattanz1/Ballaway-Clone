Rails.application.routes.draw do
  # namespace :api do
  #   get 'reviews/index'
  #   get 'reviews/show'
  #   get 'reviews/create'
  #   get 'reviews/update'
  #   get 'reviews/destroy'
  #   get 'reviews/review_params'
  # end
  # get 'reviews/index'
  # get 'reviews/show'
  # get 'reviews/create'
  # get 'reviews/update'
  # get 'reviews/destroy'
  # get 'reviews/review_params'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  namespace :api, defaults: {format: :json} do
    resources :users, only: [:create]
    resource :session, only: [:create, :show, :destroy]
    resources :products, only: [:index, :show] do
      get 'category/:category', action: :category, as: 'category' #custom route for categories fetch
    end
    resources :reviews, only: [:index, :show, :create, :update, :destroy]
    resources :cart_items, only: [:index, :show, :create, :update, :destroy]
  end
  get '*path', to: "static_pages#frontend_index"
end
