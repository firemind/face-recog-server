Rails.application.routes.draw do

  get 'admin/dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  post '/store' => 'api#store'
  post '/classify' => 'api#classify'
  post '/track' => 'api#track'
  resources :histories
  resources :trackings
  resources :tracked_images
  resources :labels do
    collection do
      patch :random_recluster
    end
  end

  resources :locations do
    member do
      get :current
    end
  end

  root "trackings#last"
end
