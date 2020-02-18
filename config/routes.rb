Rails.application.routes.draw do
  root to:'sessions#new'
  resources :users do
    member do
      get :favorites_list
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :posts do
    collection do
      post :confirm
    end
  end
end
