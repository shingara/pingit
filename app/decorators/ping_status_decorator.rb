class PingStatusDecorator < ApplicationDecorator
  decorates :ping_status

  def date
    I18n.l(ping_status.updated_at)
  end
end
