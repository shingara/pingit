require 'spec_helper'

describe 'show.html.slim' do
  include DecoratorHelper

  let(:url_decorate) {
    UrlDecorator.decorate(Fabricate.build(:url))
  }

  before do
    setup_decorator
    view.stub(:url) { url_decorate }
    render :template => 'urls/show'
  end
  it 'should have title' do
    rendered.should have_css('h1')
  end
end
