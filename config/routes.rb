Rails.application.routes.draw do
  resources :posts

  # Public RSS feed
  get "/feed", to: "posts#feed", defaults: { format: :rss }

  # Admin namespace for CRUD management
  namespace :admin do
    resources :posts
  end

  root "posts#index"

  match "*path", to: "errors#not_found", via: :all
end
