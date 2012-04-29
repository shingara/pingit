require 'spec_helper'

describe UrlDecorator do
  let(:url) { Url.new }
  let(:decorator) { UrlDecorator.decorate(url) }

  describe 'uptime' do
    it 'return a string' do
      decorator.uptime.should be_a(String)
    end
  end
end
