class Url
  include Mongoid::Document

  field :link, :type => String

  validates_presence_of :link
  validates_format_of :link, :with => URI::regexp(%w(http https))
end
