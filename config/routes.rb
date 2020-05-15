Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  root "pages#index"
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
end
