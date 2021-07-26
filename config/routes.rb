Rails.application.routes.draw do
  # resources :mechanics

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  post '/mechanics/:mechanic_id/work_orders', to: 'work_orders#create'
end
