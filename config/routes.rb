Rails.application.routes.draw do
root 'users#index'
resources :users, only: [:show] do
resources :posts, only: [:show,:index]
end

# resources :posts, only: [:show, :index]
end
