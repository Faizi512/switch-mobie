Rails.application.routes.draw do
	  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	get '/amp' => 'amp#index'
  get '/amp/sim-deal-only' => 'amp#sim_deal_only'
  get '/:page_name' => 'pages#show'
  resources :facebook_custom_audience
	root 'pages#index'
end