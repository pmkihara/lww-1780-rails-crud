Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # as 7 rotas do crud são a mesma coisa que resources :restaurants
  get '/restaurants', to: 'restaurants#index'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant
  patch '/restaurants/:id', to: 'restaurants#update'
  delete '/restaurants/:id', to: 'restaurants#destroy'
  get 'restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant

  # Defines the root path route ("/")
  # root "posts#index"
end
