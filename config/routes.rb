Rails.application.routes.draw do
  resources :reviews
  root "movies#index"

# name of action, url, name of controller and method
  # get "movies" => "movies#index"
  # get "movies/new" => "movies#new"
  # get "movies/:id" => "movies#show", as: "movie"
  # get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  # patch "movies/:id" => "movies#update"

  resources :movies
end