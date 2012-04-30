require 'spec_helper'

describe UrlOverviewRole do
  let(:url) { Url.new }

  before do
    url.extend(UrlOverviewRole)
  end

  describe '#downtime' do
    it 'return an integer' do
      url.downtime.should == 1
    end
  end
end
