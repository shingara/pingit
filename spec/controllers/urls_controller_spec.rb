require 'spec_helper'

describe UrlsController do
  describe UrlsController::Index do

    let(:controller) {  UrlsController::Index.new }

    describe "#urls" do

      context "without params" do
        it 'should return all urls' do
          controller.urls.should == Url.all
        end
      end
    end
  end

  describe UrlsController::New do

    let(:controller) {  UrlsController::New.new }

    describe "#urls" do
      it 'should return an url' do
        controller.url.should be_a(Url)
      end
    end
  end

  describe UrlsController::Create do
    let(:controller) {  UrlsController::Create.new }
    context "with params" do
      let(:link) { 'http://hello.com' }
      before do
        controller.params = {'url' => {'link' => link} }
      end

      describe '#url' do
        it 'create an Url model' do
          lambda do
            controller.url
          end.should change(Url, :count)
        end

        it 'return an Url model' do
          controller.url.should be_a(Url)
        end

        it 'return an url persisted' do
          controller.url.should be_persisted
        end

        it 'create an url with link' do
          controller.url.link.should == link
        end
      end
    end

  end

  describe UrlsController::Show do
    let(:url) { Url.new }
    let(:controller) {  UrlsController::Show.new }
    describe '#url' do
      before do
        Url.should_receive(:find).with(url.id.to_s).and_return { url }
        controller.params = { id: url.id.to_s }
      end
      it 'return an Url model' do
        controller.url.should be_a(UrlDecorator)
      end
      it 'return url with id pass in args' do
        controller.url.should eq(url)
      end
    end

  end
end
