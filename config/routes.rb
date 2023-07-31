Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#welcome"

  resources :users do 
    resources :events, only: %i[create new]
  end
  resources :events, only: %i[index]
  resources :search, only: %i[index create]
  namespace :search do
    resources :users, only: %i[show]
  end
  get "dashboard", to: "search#dashboard", as: :search_dashboard
  get "find_friends", to: "search#find_friends", as: :find_friends
  get "search_results", to: "search#search_results", as: :search_results

  resources :events, only: [:index]

end
