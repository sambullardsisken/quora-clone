Quora::Application.routes.draw do
  root to: 'users#new'

  resources :users
  resource :session
  resources :questions do
    collection do
      get 'feed'
    end
    resources :answers, :only => [:create]
  end

  resources :answers, :only => [:show] do
    resources :comments, :only => [:index]
  end

  resources :subjects do
    resources :topics, :only => [:index]
  end

  resources :topics, :only => [:index, :show] do
    resources :questions, :only => [:index]
  end

  resources :comments, :only => [:create]
  resources :answer_votes, :only => [:create]
  resources :answer_down_votes, :only => [:create]
  resources :question_followings, :only => [:create, :destroy]
  get 'questions/feed' => 'questions#feed', :as => :feed_questions

end
