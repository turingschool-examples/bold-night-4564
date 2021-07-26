Rails.application.routes.draw do

get '/mechanics',     to: 'mechanics#index'
get '/mechanics/:id', to: 'mechanics#show'

post '/mechanics/:id/ride_mechanics', to: 'ride_mechanics#create'
end
