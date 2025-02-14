Rails.application.routes.draw do
  get 'bookmarks/index'
  resources :lists do
    resources :bookmarks, only: %w[show edit new create update]
  end
  resources :bookmarks, only: :destroy
end
