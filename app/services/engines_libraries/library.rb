module EnginesLibraries
  class Library

    def initialize(opts)
      @name = opts[:name]
      @url = opts[:url]
    end

    def apps
      JSON.parse(RestClient::Request.execute(method: :get, url: @url, verify_ssl: false)).deep_symbolize_keys[:softwares]
    rescue => e
      Rails.logger.warn "Engines Library #{@url} API call failed: #{e}"
      []
    end

  end
end
