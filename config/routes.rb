Rails.application.routes.draw do
  resources :users
  resources :employees
  resources :students
  resources :images

  get "/send_details", to: "students#send_details"
  root "home#index"
end
