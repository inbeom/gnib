require 'spec_helper'

describe Gnib::Configurations do
  it "is not initialized by constructor" do
    expect { Gnib::Configurations.new }.should raise_error
  end

  describe "#singleton_object" do
    it "does not return nil object" do
      Gnib::Configurations.singleton_object.should_not == nil
    end

    it "returns the singleton object" do
      obj_before = Gnib::Configurations.singleton_object
      obj_after = Gnib::Configurations.singleton_object

      obj_before.object_id.should == obj_after.object_id
    end
  end

  context "after initialization of singleton object" do
    let(:config) { Gnib::Configurations.singleton_object }

    describe "#application_id=" do
      it "sets application id" do
        config.application_id = 'myid'
        config.application_id.should == 'myid'
      end
    end

    describe "#api_root" do
      it "returns default value if not modified" do
        config.api_root.should == 'http://api.bing.net/json.aspx'
      end
    end

    describe "#api_root=" do
      it "sets api root uri" do
        config.api_root = 'http://google.com'
        config.api_root.should == 'http://google.com'
      end
    end
  end
end


