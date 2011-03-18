Municipality::Application.routes.draw do

  resources :reports

  root :to => "pages#home"

  get "pages/home"

  get "pages/contacts"

  get "pages/about"

  devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions', :omniauth_callbacks => "users/omniauth_callbacks"}

end
