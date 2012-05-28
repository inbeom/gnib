require 'uri'
require 'cgi'

require 'gnib/search_helper'

module Gnib
  class Search
    extend SearchHelper

    PARAMS = [:query, :sources, :market, :version, :adult, :options, :latitude, :longitude]

    SPECIFIC_PARAMS = {
      :image => [:count, :offset, :filters],
      :web   => [:count, :offset, :file_type, :options],
      :news  => [:location_override, :category, :sort_by],
      :phonebook => [:count, :offset, :file_type, :loc_id, :sort_by],
      :related_search => [],
      :spell => [],
      :translation => [:source_language, :target_language],
      :video => [:count, :offset, :filters, :sort_by]
    }

    def initialize(q, options = {})
      @parameters = {}

      # Set default values for required parameters
      @parameters[:app_id] = Gnib.config.application_id
      @parameters[:sources] = ['Web']
      @parameters[:query] = q

      # Iterate params array except query
      (PARAMS - [:query]).each do |param|
        @parameters[param] = options[param] if options[param]
      end

      SPECIFIC_PARAMS.each do |source, params|
        if options[source]
          @parameters[source] = {}

          params.each do |param|
            @parameters[source][param] = options[source][param] if options[source][param]
          end
        end
      end
    end

    # Returns a SearchRequest object initialized with URI of self
    def request
      SearchRequest.new self.request_uri
    end

    protected
      def request_uri
        URI.parse("#{Gnib.config.api_root}?#{serialized_parameters}")
      end

      # Convert @parameters into HTTP GET parameters
      def serialized_parameters
        @parameters.map do |k,v|
          if v.is_a? Hash
            # Source-specific parameters
            expanded_hash_parameters(k, v)
          else
            # General required and optional parameters
            "#{k.to_s.camelize}=#{CGI::escape(serialized_parameter(v))}"
          end
        end.join('&')
      end

      # Expand parameters organized in hash form which is used for
      # source-specific purpose to serialized GET parameter string.
      def expanded_hash_parameters(source, params_hash, options = {})
        base_str = "#{source.to_s.camelize}"

        params_hash.map do |k, v|
          "#{base_str}.#{k.to_s.camelize}=#{serialized_parameter(v)}"
        end.join('&')
      end

      # Serialize parameter values into string form what Bing recommends them to
      # be. Currently supports String and Array parameters.
      #
      # String parameters
      def serialized_parameter(v)
        case v
        when String
          v
        when Array
          v.map(&:to_s).join(' ')
        else
          v.to_s
        end
      end
  end
end
