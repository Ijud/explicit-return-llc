Rails.application.routes.draw do

resources :users, only: [:new, :create, :show]
resources :sessions, only: [:new, :create, :destroy]
resources :cohorts
root 'cohorts#new'
get 'logout', to: "sessions#destroy"

end
