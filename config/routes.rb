Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/mechanics/:mechanic_id/workloads', to: 'workloads#create'

  get '/parks/:id', to: 'parks#show'
end
