Rails.application.routes.draw do
	#root 'donors#index'
	post '/donors', to: 'donors#create'
	post '/verify', to: 'donors#verify'
	#resources :donors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
