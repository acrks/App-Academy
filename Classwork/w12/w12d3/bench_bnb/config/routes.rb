Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    # , :show, :index, :edit, :update, :destroy
    resources :users, only: [:create]
    resources :benches, only: [:index, :create]
    resource :session, only: [:create, :destroy]
  end
  root to: 'static_pages#root'
end
