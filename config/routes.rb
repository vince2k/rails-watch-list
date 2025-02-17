Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, except: :index do
    resources :bookmarks, only: %w[new create]
  end
  resources :bookmarks, only: :destroy
end
