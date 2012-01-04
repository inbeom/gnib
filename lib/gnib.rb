require 'active_support'
require 'active_support/inflector'
require 'gnib/configurations'
require 'gnib/search_request'
require 'gnib/search'
require 'gnib/search_result'
require 'gnib/response'

module Gnib
  class << self
    def config
      if block_given?
        yield Configurations.singleton_object
      else
        Configurations.singleton_object
      end
    end
  end
end
