Rails.application.routes.draw do
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
