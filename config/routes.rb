Rails.application.routes.draw do
  resources :users
  resources :items
  resources :todos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
end
