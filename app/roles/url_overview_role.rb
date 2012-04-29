module UrlOverviewRole

  # Number of ping
  def ping_status_count
    @ping_status_count ||= self.ping_statuses.count
  end

  # Number of ping with success
  def ping_status_success_count
    @ping_status_success_count ||= self.ping_statuses.where(:status => 200).count
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

  end
end
