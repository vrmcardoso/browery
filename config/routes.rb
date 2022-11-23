Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "breweries#home"
  resources :breweries, only: [:home, :index, :new, :create, :edit, :show, :update] do
    resources :bookings, only: [:new, :create]
  end
  resources :users, only: [:new, :create, :edit, :show]
end
