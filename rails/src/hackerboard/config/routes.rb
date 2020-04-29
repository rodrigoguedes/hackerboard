Rails.application.routes.draw do
  # get "/", to: "questions#index"
  # root to: "questions#index", locale: I18n.default_locale
  get "/" => redirect("#{I18n.default_locale}")

  scope "/:locale" do
    get "/", to: "questions#index", as: "home"

    get "/cadastre-se", to: "signup#new", as: "signup"
    post "/cadastre-se", to: "signup#create", as: false

    get "/entrar", to: "login#new", as: "login"
    post "/entrar", to: "login#create", as: false

    delete "/sair", to: "login#destroy", as: "logout"
  end
end
