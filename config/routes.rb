Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :mechanics, only: [:index, :show] do
    resources :mech_rides, only: [:create]
  end
end
