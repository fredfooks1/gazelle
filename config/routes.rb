Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :companies
  resources :tasks
  resources :gazelle_runners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'design', to: 'pages#design'
end
