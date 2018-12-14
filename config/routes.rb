Rails.application.routes.draw do
  #################### home #######################
  get '/', to: 'home#top'
  #################################################
  #get '/signup', to: 'users#new'
  post '/', to: 'users#create'
  ##################  Session  ####################
  #get '/login', to:'sessions#new'
  patch '/', to:'sessions#create' #patchにしてるのはどうしても'/'が使いたいから
  delete '/logout', to:'sessions#destroy'
  ##################  users  #########################
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
