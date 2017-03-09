Rails.application.routes.draw do
  get "/logout" => 'sessions#delete'
  resources :users, only: [:new, :create, :show]
  resources :cohorts
  root 'cohorts#new'
end
