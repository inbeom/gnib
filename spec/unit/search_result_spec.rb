require 'spec_helper'

describe Gnib::SearchResult do
  context "when image results are fetched" do
    let(:result) { Gnib::Response.new(File.open(File.join(File.dirname(__FILE__), '../sample_image_response'), 'r:ASCII-8BIT').read).results_for(:image).first }

    describe "#media_url" do
      it "returns media url of the result" do
        result.media_url.should == "http:\/\/www.blog.webtec-braun.com\/wp-content\/uploads\/google.jpg"
      end
    end

    describe "#url" do
      it "returns url of the result" do
        result.url.should == "http:\/\/www.blog.webtec-braun.com\/google\/top-news-google-setzt-auf-schnelligkeit.html"
      end
    end

    describe "#width" do
      it "returns width of the result" do
        result.width.should == 600
      end
    end

    describe "#height" do
      it "returns height of the result" do
        result.height.should == 400
      end
    end

    describe "#file_size" do
      it "returns file size of the result" do
        result.file_size.should == 15719
      end
    end

    describe "#content_type" do
      it "returns content type of the result" do
        result.content_type.should == "image/jpeg"
      end
    end

    describe "#thumbnail_url" do
      it "returns url of thumbnail of the result" do
        result.thumbnail.url.should == "http:\/\/ts4.mm.bing.net\/images\/thumbnail.aspx?q=1524014450527&id=421bf34508bee00c8f75b0af9529c1ab"
      end
    end

  end

  context "when web results are fetched" do
    let(:result) { Gnib::Response.new(File.open(File.join(File.dirname(__FILE__), '../sample_web_response'), 'r:ASCII-8BIT').read).results_for(:web).first }

    it "parses the json and retrieves attributes" do
      result.title.should == 'Google'
    end
  end
end
