Rails.application.routes.draw do

  get '/hello_world'      => 'application#hello_world'
  get '/hello/:name'      => 'application#hello_world'

  # Posts
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :comments, only: :index
end
