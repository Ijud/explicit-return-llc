Rails.application.routes.draw do

resources :users, only: [:new, :create, :show]
resources :sessions, only: [:new, :create, :destroy]
resources :cohorts

get 'logout', to: "sessions#destroy"

root 'cohorts#new'


end
