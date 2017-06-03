Rails.application.routes.draw do
  # root to: 'search#search'
  get '/search' => 'search#search', as: :search
 resources :sessions, only: [:update]
 resources :projects
  get '/' => 'search#asdf'
end
