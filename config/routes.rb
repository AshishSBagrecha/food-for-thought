Rails.application.routes.draw do
  get 'food/index'
  get 'food/login'
  root :to => "food#login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
