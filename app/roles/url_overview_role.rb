module UrlOverviewRole

  # Number of ping
  def ping_status_count
    @ping_status_count ||= self.ping_statuses.count
  end

  # Number of ping with success
  def ping_status_success_count
    @ping_status_success_count ||= ping_status_success.count
  end

  # Number of failed ping
  def ping_status_failed_count
    ping_status_count - ping_status_success_count
  end

  # The uptime
  #
  # @return [ Integer ] the percent of uptime
  def uptime
    (ping_status_success_count / ping_status_count) * 100
  end

  # The time of downtime
  #
  def downtime
    ping_status_failed_count
  end

  def avg_response_time
    ping_status_success.sum(:response_time) / ping_status_success_count
  end

  private

  def ping_status_success
    self.ping_statuses.where(:status => 200)
  end
end
