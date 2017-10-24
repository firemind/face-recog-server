Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  post '/store' => 'api#store'
  post '/classify' => 'api#classify'
  post '/track' => 'api#track'
  resources :histories
  resources :trackings
  resources :labels

  root "trackings#last"
end
