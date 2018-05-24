Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :companies, only: [ :new, :create, :destroy, :edit]
  get "company-dashboard", to: "companies#show", as: :company_dashboard
  resources :tasks
  patch "accept-task", to: "tasks#accept_task", as: :accept_task
  resources :gazelle_runners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'design', to: 'pages#design'
end
