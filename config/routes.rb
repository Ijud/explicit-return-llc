Rails.application.routes.draw do
	get "/logout" => 'sessions#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
