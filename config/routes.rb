Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#welcome"

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index]
    end
  end

  resources :users, only: %i[show], as: :dashboard
end
