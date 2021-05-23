Rails.application.routes.draw do
  resources :notes
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/me", to: "users#me"
end
