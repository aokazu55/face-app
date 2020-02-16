Rails.application.routes.draw do
  get root to: 'posts#new'
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
