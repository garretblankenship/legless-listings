Rails.application.routes.draw do
  get "/", to: "pages#home", as: "root"
  resources :listings
end
