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

describe Ping do

  let(:ping) { Ping.new }
  let(:url) { Url.create(:link => 'http://example.org') }

  describe '.perform' do
    let(:perform) { ping.perform(url.id) }
    context 'with a 200 request' do
      before do
        ping.stub(:connection).and_return{
          Faraday.new do |builder|
            builder.adapter :test, Faraday::Adapter::Test::Stubs.new do |stub|
              stub.get('/') { [200, {}, 'egg'] }
            end
          end
        }
      end
      it 'should create a ping_status document' do
        expect {
          perform
        }.to change(url.ping_statuses, :size).by(1)
      end
      it 'should create a ping_status with status 200' do
        ping_status = perform
        ping_status.status.should == 200
      end
      it 'should create a ping_status with response_time' do
        perform.response_time.should > 0
      end
    end

    context "with a SocketError raise" do
      before do
        ping.stub(:connection).and_return{
          Faraday.new do |builder|
            builder.adapter :test, Faraday::Adapter::Test::Stubs.new do |stub|
              stub.get('/') { raise SocketError.new('getaddrinfo: nodename nor servname provided, or not known') }
            end
          end
        }
      end
      it 'should create a new ping_status' do
        expect {
          perform
        }.to change(url.ping_statuses, :size).by(1)
      end

      it 'should create ping_status with a 404 status' do
        perform.status.should == 404
      end
      it 'should create ping_status with an unknown_host true' do
        perform.unknown_host.should be_true
      end

    end

    context "with a Faraday::Error::ConnectionFailed raise" do
      before do
        ping.stub(:connection).and_return{
          Faraday.new do |builder|
            builder.adapter :test, Faraday::Adapter::Test::Stubs.new do |stub|
              stub.get('/') { raise Faraday::Error::ConnectionFailed.new('getaddrinfo: nodename nor servname provided, or not known') }
            end
          end
        }
      end
      it 'should create a new ping_status' do
        expect {
          perform
        }.to change(url.ping_statuses, :size).by(1)
      end

      it 'should create ping_status with a 404 status' do
        perform.status.should == 404
      end
      it 'should create ping_status with an unknown_host true' do
        perform.unknown_host.should be_true
      end
    end
  end

end
