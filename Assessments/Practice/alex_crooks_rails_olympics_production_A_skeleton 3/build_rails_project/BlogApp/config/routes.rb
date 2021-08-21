Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :blogs, only: [:show, :new, :index, :create, :destroy]
  resources :users, only: [:create, :new, :show]
  resources :comments, only: [:create, :destroy]
end
