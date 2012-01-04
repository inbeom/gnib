require 'spec_helper'

describe Gnib::Response do
  let(:rsp) { Gnib::Response.new(File.open(File.join(File.dirname(__FILE__), '../sample_web_response'), 'r:ASCII-8BIT').read) }

  describe "#result_count_of" do
    it "counts number of total results" do
      rsp.result_count_of(:web).should == 28400000
    end
  end

  describe "#results_for" do
    it "returns result objects for each result" do
      rsp.results_for(:web).first.class.should == Gnib::SearchResult
    end

    it "returns results in one page" do
      rsp.results_for(:web).count.should == 10
    end
  end

  describe "#results" do
    it "returns appropriate result objects" do
      rsp.results.first.class.should == Gnib::SearchResult
    end

    it "returns all results objects" do
      rsp.results.count.should == 10
    end
  end
end
