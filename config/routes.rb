Pingit::Application.routes.draw do

  resources :urls

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root :to => "urls#index"
end
