Rails.application.routes.draw do
  root 'articles#home'
  get '/about', to:'articles#about'
  #get '/show/:id', to:'articles#show'

  resources 'articles'
end
