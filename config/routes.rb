Rails.application.routes.draw do
  get 'food/login'
  post 'food/login_action'
  root :to => "food#login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
