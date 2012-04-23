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
end
