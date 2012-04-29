class PingStatus
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, :type => Integer

  belongs_to :url

  validates_presence_of :status

end
