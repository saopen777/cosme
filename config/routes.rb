Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tweet#index"
  resources :tweet do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
