class UrlsController < ApplicationController

  def urls
    UrlDecorator.decorate(Url.all)
  end
  helper_method :urls

  def url; @url; end
  helper_method :url

  def new
    @url = Url.new(params['url'])
  end

  def show
    @url = UrlDecorator.decorate(Url.find(params[:id]))
  end

  def create
    @url = Url.create(params['url'])
    if url.persisted?
      redirect_to url_url(url), {
        :flash => {
          :success => t('urls.flash.create.success', :link => url.link)
        }
      }
    else
      render :new
    end
  end

  def destroy
    if Url.find(params[:id]).destroy
      redirect_to urls_url, :flash => { :success => I18n.t('urls.flash.destroy.success') }
    end
  end
end
