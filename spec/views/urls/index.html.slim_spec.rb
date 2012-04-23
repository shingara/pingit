require 'spec_helper'

describe 'index.html.slim' do
  before do
    view.stub(:urls) { [ Url.new, Url.new] }
    render :template => 'urls/index'
  end
  it 'should have title' do
    rendered.should have_css('h1')
  end
end
