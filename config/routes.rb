Rails.application.routes.draw do
  # root to: 'search#search'
  get '/search' => 'search#search', as: :search
  get '/' => 'search#asdf'
end
