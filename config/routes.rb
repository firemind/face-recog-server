Rails.application.routes.draw do
  get 'celebs/index'

  get 'celebs/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  post '/store' => 'api#store'
  post '/classify' => 'api#classify'
  post '/track' => 'api#track'
  resources :histories
  resources :trackings
  resources :labels
  resources :locations
  resources :celebs

  root "trackings#last"
end
