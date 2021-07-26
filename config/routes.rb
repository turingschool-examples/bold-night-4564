Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mechanics

  resources :rides

  post '/mechanic_rides', to: 'mechanic_rides#create', as: 'mechanic_rides'
end
