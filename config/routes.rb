Rails.application.routes.draw do
  root 'posts#index'

  get '/posts', to: 'posts#index'
  
  get '/posts/:id' , to: 'posts#show'
  
  get '/users/:username/posts' , to: 'posts#from_user'
end
