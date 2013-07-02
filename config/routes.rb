Quora::Application.routes.draw do
  resources :users
  resource :session
  resources :questions

  root :to => "Users#new"
end
