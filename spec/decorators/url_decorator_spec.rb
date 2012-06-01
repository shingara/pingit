require 'spec_helper'

describe UrlDecorator do
  let(:url) { Fabricate(:url) }
  let(:decorator) { UrlDecorator.decorate(url) }

  describe 'uptime' do
    it 'return a string' do
      decorator.uptime.should be_a(String)
    end
  end
end
