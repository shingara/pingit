require 'spec_helper'

describe 'show.html.slim' do
  include DecoratorHelper

  before do
    setup_decorator
    view.stub(:url) { UrlDecorator.decorate(Url.new) }
    render :template => 'urls/show'
  end
  it 'should have title' do
    rendered.should have_css('h1')
  end
end
