class PingStatus
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, :type => Integer
  field :unknown_host, :type => Boolean, :default => false

  belongs_to :url

  validates_presence_of :status

end
