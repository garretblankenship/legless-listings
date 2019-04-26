Rails.application.routes.draw do
  devise_for :users, path: "/", path_names: {sign_in: "login"}
  get "/", to: "pages#home", as: "root"
  resources :listings
  post "/payments", to: "payments#stripe"
  get "/payments/success", to: "payments#success"
end
