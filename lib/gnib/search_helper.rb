module Gnib
  module SearchHelper
    def get(q, options = {})
      search = self.new(q, options)
      search.request.response.results
    end
  end
end
