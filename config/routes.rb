Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'

  resources :search do
   collection { get :search }
  end

  put '/search' => 'search#update', as: :search_update
  resources :settings
end
