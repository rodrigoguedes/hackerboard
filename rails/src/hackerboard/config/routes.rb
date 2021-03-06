Rails.application.routes.draw do
  # get "/", to: "questions#index"
  # root to: "questions#index", locale: I18n.default_locale
  get "/" => redirect("#{I18n.default_locale}")

  scope "/:locale" do
    get "/", to: "questions#index", as: "home"

    get "/", to: "users#show", as: "user"

    get "/cadastre-se", to: "signup#new", as: "signup"
    post "/cadastre-se", to: "signup#create", as: false

    get "/categorias/:category_id", to: "categories#show", as: "category"

    get "/entrar", to: "login#new", as: "login"
    post "/entrar", to: "login#create", as: false

    delete "/sair", to: "login#destroy", as: "logout"

    get "/nova-pergunta", to: "questions#new", as: "new_question"
    post "/nova-pergunta", to: "questions#create", as: false

    get "/busca/perguntas", to: "questions#search", as: "question_search"

    get "/perguntas/:id/feed",
      to: "questions#feed",
      as: "question_feed",
      format: "atom"

    get "/perguntas/:id", to: "questions#show", as: "question"

    post "/perguntas/:question_id/repostas", to: "replies#create", as: "new_reply"
  end
end
