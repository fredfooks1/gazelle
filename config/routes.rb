Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gazelle_runners
  resources :companies do
    resources :tasks, only: [ :new, :show, :create, :destroy ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'design', to: 'pages#design'
end
