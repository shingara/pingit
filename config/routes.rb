Pingit::Application.routes.draw do
  focused_controller_routes do
    resources :urls
  end
  root :to => proc { |env| UrlsController::Index.call(env) }
end
