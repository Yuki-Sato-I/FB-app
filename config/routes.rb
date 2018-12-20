Rails.application.routes.draw do
  ####################  likes  ########################
  post '/likes/:post_id/create', to: 'likes#create'
  delete '/likes/:post_id/destroy', to: 'likes#destroy'
  ####################  commnets  #####################
  post '/comments/new/:id', to: 'comments#create'
  ####################  posts  ########################3
  get '/posts/index', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts/new', to: 'posts#create'
  get '/posts/show/:id', to: 'posts#show'
  get '/posts/edit/:id', to: 'posts#edit'
  patch '/posts/edit/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy'
  #################### home #######################
  get '/', to: 'home#top'
  #################################################
  post '/', to: 'users#create'
  ##################  Session  ####################
  patch '/', to:'sessions#create' #patchにしてるのはどうしても'/'が使いたいから
  delete '/logout', to:'sessions#destroy'
  ##################  users  #########################
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
