require 'spec_helper'

describe "url resource" do
  it 'should see /urls' do
    get('/urls').should route_to(
      :controller => 'urls',
      :action => 'index'
    )
  end
end
