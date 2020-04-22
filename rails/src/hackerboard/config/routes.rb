Rails.application.routes.draw do
  get "/", to: "questions#index"

  get "/signup", to: "signup#new"
  post "/signup", to: "signup#create"

  get "/login", to: "login#new"
  post "/login", to: "login#create"
end
