Rails.application.routes.draw do
  resources :users

  root "users#index"

  get "users/send_mail", to: "users#send_mail"
end
