Rails.application.routes.draw do
  root to:'sessions#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :users do
    member do
      get :favorite_list
    end
  end
end
