Rails.application.routes.draw do
  root "home#index"
  as :user do
    post 'signin' => 'devise/sessions#create'
    delete 'signout' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get '/share', to: 'movies#index'
  post '/share', to: 'movies#create'
end
