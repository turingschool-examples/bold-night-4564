Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  get '/mechanics/rides/new', to: 'ride_mechanics#new'
  post '/mechanics/:id', to: 'ride_mechanics#create'

  get '/amusementparks/:id', to: 'amusement_parks#show'
end
