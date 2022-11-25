Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "breweries#home"

  resources :breweries, only: [:home, :index, :new, :create, :edit, :show, :update] do
    resources :bookings, only: [:create]
  end
  get "profile", to: "pages#profile"
  resources :bookings, only: [] do
    patch "rate", to: "bookings#rate"
  end
end
