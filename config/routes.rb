Interviewr::Application.routes.draw do
  root :to => 'welcome#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, :only => [:show, :new, :create]
  resources :results, :only => [:new, :create, :index]
  resources :quizzes, :only => [:show, :new, :create, :index] do
    member do
      get '/analytics' => 'quizzes#analytics'
    end
  end
  resources :questions, :only => [:new, :create]
end
