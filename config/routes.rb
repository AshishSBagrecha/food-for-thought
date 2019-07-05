Rails.application.routes.draw do
  get 'food/login'
  get 'food/login_action'
  get 'food/receiver'
  get 'food/donor'
  post 'food/create_event'
  post '/food/place_order'
  root :to => "food#login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
