Interviewr::Application.routes.draw do
  root :to => 'welcome#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users, :only => [:show, :new, :create]
  resources :quizzes, :only => [:show, :new, :create]
  resources :questions, :only => [:new, :create]
end
