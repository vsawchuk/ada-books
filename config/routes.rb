Rails.application.routes.draw do

  root to: 'books#index'

  get '/books', to: 'books#index', as: 'books' # books_path


  get '/books/:id/edit', to: 'books#edit', as: 'edit_book' # edit_book_path

  get '/books/new', to: 'books#new', as: 'new_book' # new_book_path

  get '/books/:id', to: 'books#show', as: 'book' # book_path


  patch '/books/:id', to: 'books#update', as: 'update_book' # update_book_path

  post '/books', to: 'books#create', as: 'create_book' # create_book_path

  # patch '/tasks/:id/mark_complete', to: 'tasks#mark_complete'



  delete '/books/:id', to: 'books#destroy', as: 'delete_book' # delete_book_path

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
