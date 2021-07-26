Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:mech_id', to: 'mechanics#show'

  post '/mechanics/:mech_id/rides/:ride_id', to: 'maintenances#create'
end
