Rails.application.routes.draw do
  devise_for :users
  root 'songs#index'
  # # resources :top, only: [:index]
  #   collection do
  #     get 'search'
  #   end
  # end
  resources :songs, only:[:index,:show] do
    collection do
      get 'search'
    end
  end
end