Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'static_pages#root'

  namespace :api, default: { format: :json } do
    resources :todos, only: [:show, :create, :update, :index, :destroy]
  end

  
end
