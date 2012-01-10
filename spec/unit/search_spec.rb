require 'spec_helper'

describe Gnib::Search do
  before(:all) do
    Gnib.config.application_id = 'myid'
  end

  it "is initialized with query" do
    expect { s = Gnib::Search.new('google') }.should_not raise_error
  end

  context "when a string parameter is provided" do
    let(:search) { Gnib::Search.new('google') }

    it "serializes it appropriately" do
      serialized_str = search.send :serialized_parameters
      serialized_str.should include("Query=#{CGI::escape('google')}")
    end

    it "has app id in parameters" do
      serialized_str = search.send :serialized_parameters
      serialized_str.should include("AppId=myid")
    end
  end

  context "when an array parameter is provided" do
    let(:search) { Gnib::Search.new('google', :sources => ['image', 'spell']) }

    it "serializes it appropriately" do
      serialized_str = search.send :serialized_parameters
      serialized_str.should include("Sources=#{CGI::escape('image spell')}")
    end
  end
end
