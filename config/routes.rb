Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root "pages#index"
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :events, only: [:new, :create, :show, :index]
  resources :invitations, only: [:new, :create]
end
