require 'focused_controller'
module UrlsController

  class Index < ApplicationController
    def urls
      UrlDecorator.decorate(Url.all)
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
      @url ||= Url.create(params['url'])
    end
    helper_method :url

    def run
      if url.persisted?
        redirect_to urls_url, :flash => { :success => t('urls.flash.create.success', :link => url.link) }
      else
        render :new
      end
    end
  end

  class Show < ApplicationController
    def url
      UrlDecorator.decorate(Url.find(params[:id]))
    end
    helper_method :url
  end

  class Destroy < ApplicationController
    def run
      if Url.find(params[:id]).destroy
        redirect_to urls_url, :flash => { :success => I18n.t('urls.flash.destroy.success') }
      end
    end
  end
end
