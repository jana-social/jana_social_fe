Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#welcome"

  resources :search, only: [:index, :show] do
    resources :users, only: [:show]
  end

end
