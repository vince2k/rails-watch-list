Rails.application.routes.draw do
  get 'bookmarks/index'
  resources :lists do
    resources :bookmarks, only: %w[new create]
  end
  resources :bookmarks, only: :destroy
end
