PhotoStream::Application.routes.draw do
  #root 'sessions#new'
  root 'sessions#index'

  resources :events, only: [:index, :new, :create] do
    resources :photos do
      get 'search', on: :collection
    end
  end
  
  resources :users, :sessions

  #defining some routes:
  # get '/users', to: 'users#index', as: 'users'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/upload/:event_id', to: 'photos#new', as: 'upload'
  post '/upload/:event_id', to: 'photos#create', as: 'create_upload'

  get '/events/:custom_url', to: 'events#show', as: 'show_event'
  get '/events/:custom_url/edit', to: 'events#edit', as: 'edit_event'
  put '/events/:custom_url', to: 'events#update'
  patch '/events/:custom_url', to: 'events#update', as: 'update_event'
  delete '/events/:custom_url', to: 'events#destroy', as: 'delete_event'

  #adding search
  get '/events/:custom_url/photos/search', to: 'photos#search', as: 'photo_search'

end

# match "/stream/:id", to: "photos#index", via: 'get'
# match "/addphoto/:id", to: "photos#new", via: 'get'
