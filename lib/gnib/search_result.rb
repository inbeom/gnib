module Gnib
  class SearchResult
    def initialize(rsp_body)
      @rsp_body = rsp_body
    end
    
    def to_hash
      @rsp_body
    end

    def method_missing(sym, *args, &block)
      val = @rsp_body[sym.to_s.camelize]
      if val
        return val unless val.is_a? Hash
        return SearchResult.new val
      else
        super
      end
    end
  end
end
