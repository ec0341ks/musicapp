Rails.application.routes.draw do
  root 'top#index'
  resources :songs, only: :index
end
