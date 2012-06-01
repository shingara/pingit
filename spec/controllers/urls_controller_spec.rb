require 'spec_helper'

describe UrlsController do
  describe "get /urls" do
    before { get :index }
    it { response.should be_success }
    it { response.should render_template('urls/index') }
  end

  describe "get /urls/new" do
    before { get :new }
    it { response.should be_success }
    it { response.should render_template("urls/new") }
    it { assigns(:url).should_not be_persisted }
  end

  describe "post /urls" do
    before { post :create, :url => {:link => 'http://google.com'} }
    it { response.should redirect_to(url_url(assigns(:url))) }
    it { flash[:success].should eq I18n.t('urls.flash.create.success', :link => assigns(:url).link) }
    it { assigns(:url).should be_persisted }
  end

  describe "get /urls/:id" do
    let(:url) { Fabricate(:url) }
    before { get :show, :id => url.to_param }
    it { response.should be_success }
    it { assigns(:url).should eq UrlDecorator.decorate(url) }
  end

end
