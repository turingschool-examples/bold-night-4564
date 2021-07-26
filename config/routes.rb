Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  post '/mechanics/:mechanic_id/work_orders', to: 'work_orders#create'

  get '/amusement_parks/:id', to: 'amusement_parks#show'
end
