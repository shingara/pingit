require 'focused_controller'
module UrlsController

  class Index < ApplicationController
    def urls
      Url.all
    end
    helper_method :urls
  end
end
