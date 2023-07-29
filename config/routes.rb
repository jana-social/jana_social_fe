Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#welcome"

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index]
      resources :search, only: [:index, :create]
      namespace :search do
        resources :users, only: [:show]
      end
      get "dashboard", to: "search#dashboard", as: :search_dashboard
    end
  end
end
