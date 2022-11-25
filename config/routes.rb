
Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: "breweries#home"
  resources :bookings, only: [] do
    member do
      patch "rate"
    end
  end
  resources :breweries, only: [:home, :index, :new, :create, :edit, :show, :update] do
    resources :bookings, only: [:create]
  end
  resources :users, only: [:new, :create, :edit, :show, :update]
  get "profile", to: "pages#profile"
end
