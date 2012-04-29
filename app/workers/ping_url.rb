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

class Ping
  include Sidekiq::Worker

  def perform(url_id)
    url = Url.find(url_id)
    `curl #{url.link}`
  end
end
