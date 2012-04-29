require 'spec_helper'

describe PingUrl do

  describe ".perform" do
    context 'with 2 urls' do
      let!(:urls) {
        Url.delete_all
        urls = []
        2.times { |i|
          urls << Url.create(:link => "http://example-#{i}.org")
        }
        urls
      }
      before { Ping.jobs.clear }
      it 'add 2 jobs' do
        expect {
          PingUrl.new.perform
        }.to change(Ping.jobs, :size).by(2)
      end
      it 'add job with url.id' do
        PingUrl.new.perform
        Ping.jobs.map{|j| j['args']}.flatten.should == urls.map(&:id)
      end
    end
  end

end
