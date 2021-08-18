Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create] do
    get :activate, on: :collection
  end
  resource :session, only: [:new, :create, :destroy]
  
  get '/bands', to: 'bands#index', as: 'bands'
  post '/bands', to: 'bands#create'
  get '/bands/new', to: 'bands#new', as: 'new_band'
  get '/bands/:id/edit', to: 'bands#edit', as: 'edit_band'
  get '/bands/:id', to: 'bands#show', as: 'band'
  patch '/bands/:id', to: 'bands#update'
  delete '/bands/:id', to: 'bands#destroy'
end
