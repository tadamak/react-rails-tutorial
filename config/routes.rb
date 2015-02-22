Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :comments, only: [:index, :create]
  end
end
