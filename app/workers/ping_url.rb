class PingUrl
  include Sidekiq::Worker

  # Check all url to ping and generate a
  # queue to each ping
  #
  def perform
    Url.only(:id).all.each do |url|
      Ping.perform_async(url.id)
    end
  end
end

require 'active_support/core_ext/module/delegation'
class Ping
  include Sidekiq::Worker

  def perform(url_id)
    @url_id = url_id
    url.ping_statuses.create(
      :status => connection.get(request_uri).status
    )
  rescue SocketError, Faraday::Error::ConnectionFailed
    url.ping_statuses.create(
      :status => 404,
      :unknown_host => true
    )
  end

  # Url object defing by @url_id
  #
  # @return [ Url ] the url model associate
  def url
    @url ||= Url.find(@url_id)
  end

  # Uri of link of url
  #
  # @return [ URI ] the uri of link of url
  def uri
    @uri ||= URI(url.link)
  end
  delegate :request_uri, { :to => :uri }

  # Base url of link request
  #
  # @return [ String ] the base_url
  def base_url
    uri.scheme + "://" + uri.host
  end

  # The faraday connection to request
  #
  # @return [ Faraday ] the faraday associate to base_url
  def connection
    Faraday.new(base_url)
  end
end
