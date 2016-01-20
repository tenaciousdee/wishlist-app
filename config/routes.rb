Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
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

  get '/public' => 'lists#public_lists'
  get '/public/:id' => 'lists#public_show'

  post '/products_api/' => 'products#create_api'
  delete '/products_api/:id' => 'products#destroy_api'

  post '/added_products' => 'added_products#create'
  get '/added_products/:id/edit' => 'added_products#edit'
  patch '/added_products/:id' => 'added_products#update'
  delete '/added_products/:id' => 'added_products#destroy'
end


