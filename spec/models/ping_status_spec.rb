require 'spec_helper'

describe PingStatus do
  describe "Attributes" do
    it { should have_field(:status).of_type(Integer) }
    it { should have_field(:response_time).of_type(Float) }
    it { should have_field(:unknown_host).of_type(Boolean).with_default_value_of(false) }
    it { should be_timestamped_document }
  end

  describe "Association" do
    it { should belong_to(:url) }
  end

  describe "Validations" do
    it { should validate_presence_of(:status) }
  end
end
