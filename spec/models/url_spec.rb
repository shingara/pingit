require 'spec_helper'

describe Url do
  describe "Attributes" do
    it { should have_field(:link).of_type(String) }
  end
end
