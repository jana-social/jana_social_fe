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
  get "find_friends", to: "search#find_friends", as: :find_friends
  get "search_results", to: "search#search_results", as: :search_results

  resources :events, only: [:index]

  resources :users, only: %i[show], as: :dashboard

  get '/login', to: 'sessions#login_form'
  post '/login', to: 'sessions#login'
  get '/exit', to: 'sessions#logout', as: :logout
end
