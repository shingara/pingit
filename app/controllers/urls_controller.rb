require 'focused_controller'
module UrlsController

  class Index < ApplicationController
    def urls
      Url.all
    end
    helper_method :urls
  end

  class New < ApplicationController
    def url
      Url.new
    end
    helper_method :url
  end

  class Create < ApplicationController
    def url
      Url.create(params['url'])
    end
    helper_method :url

    def run
      if url.persisted?
        redirect_to urls_url, :notice => t('urls.flash.create')
      else
        render :new
      end
    end
  end
end
