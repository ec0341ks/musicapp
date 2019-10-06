Rails.application.routes.draw do
  devise_for :users
  root 'songs#index'
  resources :messages, only: [:index,:create]
  resources :users, only: [:edit, :update]
  resources :songs, only:[:index,:show] do
    collection do
      get 'search'
    end
  end
end