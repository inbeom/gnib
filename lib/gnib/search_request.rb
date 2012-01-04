require 'uri'
require 'net/http'

module Gnib
  class SearchRequest
    def initialize(uri)
      @uri = uri
    end

    def response
      @response_body ||= do_http_request.body
      Response.new(@response_body)
    end

    protected
      def do_http_request
        http = Net::HTTP.new(@uri.host, @uri.port)
        http.request(Net::HTTP::Get.new(@uri.request_uri))
      end
  end
end

