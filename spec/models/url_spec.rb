require 'spec_helper'

describe Url do
  describe "Attributes" do
    it { should have_field(:link).of_type(String) }
  end

  describe "Validation" do
    it { should validate_presence_of(:link) }
    it { should validate_format_of(:link).to_allow("http://google.com").not_to_allow("google.com") }
  end
end
