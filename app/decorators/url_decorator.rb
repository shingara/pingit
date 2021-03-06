class UrlDecorator < ApplicationDecorator
  decorates :url

  def uptime
    url.extend(UrlOverviewRole)
    h.number_to_percentage(url.uptime, :precision => 2)
  end

  def downtime
    url.extend(UrlOverviewRole)
    h.number_to_human(url.downtime)
  end

  def link
    h.link_to url.link, h.url_url(url)
  end

  def ping_statuses
    PingStatusDecorator.decorate(
      url.ping_statuses.desc(:updated_at).page(h.params[:page])
    )
  end

  def to_param
    url.id
  end

  def avg_response_time
    url.extend(UrlOverviewRole)
    h.number_to_human(url.avg_response_time)
  end
end
