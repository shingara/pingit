Pingit::Application.routes.draw do
  focused_controller_routes do
    resources :urls
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root :to => proc { |env| UrlsController::Index.call(env) }
end
