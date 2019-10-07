Rails.application.routes.draw do
  get 'comments/index'
  devise_for :users
  root 'songs#index'
  resources :users, only: [:edit, :update]
    resources :comments, only: [:show,:create]
  resources :songs, only:[:index,:show] do
    collection do
      get 'search'
    end
  end
end