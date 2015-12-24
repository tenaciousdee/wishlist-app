Rails.application.routes.draw do
  devise_for :users
  get '/' => 'products#index'
  get '/products' => 'products#index'
  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete '/products/:id' => 'products#destroy'

  post '/search/' => 'products#search'

  get '/lists' => 'lists#index'
  get '/lists/new' => 'lists#new'
  post '/lists' => 'lists#create'
  get '/lists/:id' => 'lists#show', as: :list
  get '/lists/:id/edit' => 'lists#edit'
  patch '/lists/:id' => 'lists#update'
  delete '/lists/:id' => 'lists#destroy'
end


