Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "lists#index"
  # get 'lists', to: 'lists#index', as: :lists
  #  # /new goes firts before anything with dynamic input as /:id

  # get "lists/new", to: "lists#new"

  # get 'lists/:id', to: "lists#show", as: :list

  # post "lists", to: "lists#create"


  resources :lists, only: [:new, :show, :index, :create] do
    resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: :destroy


  # bookmarks
  # get "lists/:id/bookmarks/new"
  # post "lists/:id/bookmarks"
  # delete "bookmarks/id"


end


# resources :restaurants do
#   resources :reviews, only: [:new, :create]
# end
# resources :reviews, only: [:show, :edit, :update, :destroy]
