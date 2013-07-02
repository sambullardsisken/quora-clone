Quora::Application.routes.draw do
  resources :users
  resource :session

  root :to => "Users#new"
end
