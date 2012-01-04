module Gnib
  class Configurations
    private_class_method :new
    attr_accessor :application_id, :api_root

    def self.singleton_object
      @singleton ||= new
    end

    def api_root
      @api_root ||= 'http://api.bing.net/json.aspx'
    end

    private
      # Prevent external initialization
      def initialize; super; end
  end
end
