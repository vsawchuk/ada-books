Rails.application.routes.draw do

  root to: 'books#index'

  resources :genres, only: [:index, :show] do
    get '/books', to: 'books#index'
  end
  resources :books

end
