Quora::Application.routes.draw do
  root to: 'users#new'

  resources :users
  resource :session
  resources :questions do
    resources :answers, :only => [:create]
  end

end
