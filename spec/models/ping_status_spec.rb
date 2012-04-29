require 'spec_helper'

describe PingStatus do
  describe "Attributes" do
    it { should have_field(:status).of_type(Integer) }
    it { should be_timestamped_document }
  end

  describe "Association" do
    it { should belong_to(:url) }
  end

  describe "Validations" do
    it { should validate_presence_of(:status) }
  end
end
