Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :equipment do
    resources :pickups, only: :create
  end

  resources :pickups, only: :index
end
