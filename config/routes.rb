Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'search#index'

  resources :search do
   collection { get :search }
  end

  put '/search' => 'search#update', as: :search_update
  resources :settings
end
