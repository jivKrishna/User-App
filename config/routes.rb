Rails.application.routes.draw do
  resources :users
  resources :images

  root "users#index"

  get "/all", to: "users#show_all"
  get "/send_mail", to: "users#send_mail"
end
