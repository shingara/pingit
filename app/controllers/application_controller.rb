class ApplicationController < ActionController::Base
  include FocusedController::Mixin
  protect_from_forgery
end
