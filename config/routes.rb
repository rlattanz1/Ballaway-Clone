Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '*path', to: "static_pages#frontend_index"


  namespace :api, defaults: {format: :json} do
      resources :users, only: [:create]
      resource :session, only: [:create, :show, :destroy]

  #   resources :reviews, only: [:index, :show, :create, :update, :destroy]
  #   resources :items, only: [:index, :show, :create, :update, :destroy]
  #   resources :users, only: [:create, :update, :destroy]
  #   resources :cart_items, only: []
  #   resource :session, only: [:create, :show, :destroy]
  end
end
