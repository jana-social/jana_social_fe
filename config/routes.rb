Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#welcome"
  post "/login", to: "sessions#create"

  resources :dashboard
  resources :events, only: [:index]

end
