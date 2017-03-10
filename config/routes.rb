Rails.application.routes.draw do

resources :users, only: [:new, :create, :show]
resources :sessions, only: [:new, :create, :destroy]
resources :cohorts, except: [:index] do
	resources :groupings
end
resources :api, only: [:index]

get 'logout', to: "sessions#destroy"

root 'sessions#new'


end
