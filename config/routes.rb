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
  resources :locations do
    member do
      get :current
    end
  end
  resources :celebs

  root "trackings#last"
end
