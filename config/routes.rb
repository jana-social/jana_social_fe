Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#welcome"

  # Defines the users path route ("/users")
  resources :users do
      resources :events, only: %i[index show create new destroy], controller: 'users/events'
      resources :rooms
      resources :friends, only: %i[index]
      ## Photos could be nested here instead of lines 15/16 but would require changes in testing and wherever those paths are called
      # resources :photos, only: %i[edit update]
  end

  get "/users/:id/photos/edit", to: "users/photos#edit", as: :user_photo_edit
  patch "/users/:id/photos", to: "users/photos#update", as: :update_photo

  patch "/users/:id/update_photo", to: "users#update_photo"

  resources :events, only: %i[index show]
  resources :search, only: %i[index create]
  namespace :search do
    resources :users, only: %i[show create]
  end

  get "search_dashboard", to: "search#search_dashboard", as: :search_dashboard
  get "find_friends", to: "search#find_friends", as: :find_friends
  get "search_results", to: "search#search_results", as: :search_results

  resources :users, only: %i[show], as: :dashboard

  get '/login', to: 'sessions#login_form'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout', as: :logout
  get '/oauth', to: 'goog_sesh#login'
  get '/callback', to: 'goog_sesh#callback'
  get '/users/:user_id/events/:event_id/edit', to: "users/events#edit", as: :event_edit
  patch '/users/:user_id/events/:event_id', to: "users/events#update", as: :event_update
  # delete '/users/:id/events/:id', to: "users/events#destroy", as: :event_destroy
end
