Rails.application.routes.draw do
  resources :categories
  resources :articles do
      resources :comments, only: [:create, :destroy, :update, :show]
  end
  devise_for :users

=begin
    get "/articles" index
    post "/articles" create
    delete "/articles" delete
    get "/articles/:id" show
    get "articles/new" new
    get "/articles/:id/edit" edit
    patch "/articles/:id" update
    put "/articles/:id" update
=end

  root 'welcome#index'
  get "/dashboard", to: "welcome#dashboard"

  put "/articles/:id/publish", to: "articles#publish"
end
