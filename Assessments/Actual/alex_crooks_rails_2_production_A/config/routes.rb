Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index]
  resources :poems, only: [:new, :create, :update, :edit]
  resource :session, only: [:new, :create, :destroy]
  resources :poems, only: [:index, :show]

end
