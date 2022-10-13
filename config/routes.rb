Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
resources :users, only: [:show] do
resources :posts, only: [:show,:index, :new, :create] do 
resources :comments, only:[:new, :create]
resources :likes, only:[:create]
    end
  end
end
