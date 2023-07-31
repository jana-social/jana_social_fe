Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#welcome"

  resources :events, only: %i[index]
  resources :search, only: %i[index create]
  namespace :search do
    resources :users, only: %i[show]
  end
  get "dashboard", to: "search#dashboard", as: :search_dashboard
  get "user_search", to: "search#user_search", as: :user_search
  get "search_results", to: "search#search_results", as: :search_results
end
