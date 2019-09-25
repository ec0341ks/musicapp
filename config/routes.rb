Rails.application.routes.draw do
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