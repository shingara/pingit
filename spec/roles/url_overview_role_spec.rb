require 'spec_helper'

describe UrlOverviewRole do
  let(:url) { Url.new }

  before do
    url.extend(UrlOverviewRole)
    url.stub(:ping_status_count).and_return(1)
  end

  describe '#downtime' do
    it 'return an integer' do
      url.downtime.should == 1
    end
  end

  describe "#ping_status_success" do
    [200, 302].each do |status|
      it "#{status} is success" do
        url = Fabricate(:url) do
          ping_statuses(:count => 1) { |parent|
            Fabricate(:ping_status, status: status, url: parent)
          }
        end
        url.extend(UrlOverviewRole)
        url.ping_status_success.should_not be_empty
      end
    end

    [404, 500].each do |status|
      it "#{status} is failure" do
        url = Fabricate(:url) do
          ping_statuses(:count => 1) { |parent|
            Fabricate(:ping_status, status: status, url: parent)
          }
        end
        url.extend(UrlOverviewRole)
        url.ping_status_success.entries.should be_empty
      end
    end
  end
end
