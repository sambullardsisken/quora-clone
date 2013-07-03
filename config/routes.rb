Quora::Application.routes.draw do
  root to: 'users#new'

  resources :users
  resource :session
  resources :questions do
    resources :answers, :only => [:create]
  end

  resources :subjects do
    resources :topics, :only => [:index]
  end

  resources :topics, :only => [:index, :show] do
    resources :questions, :only => [:index]
  end

end
