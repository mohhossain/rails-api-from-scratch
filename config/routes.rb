Rails.application.routes.draw do
  resources :movies, only:[:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get '/movies', to: 'movies#index'
  get '/oldest', to: 'movies#oldest'
end
