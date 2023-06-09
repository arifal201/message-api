Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  
  post '/login', to: 'users#login'

  resources :conversations, only: [:index, :create, :show] do
    resources :messages, only: [:index, :create, :show]
  end
end
