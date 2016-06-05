module EnginesSystemCore
  module CoreApi
    module ApiCall

      private

      def get(command, opts={})
        parse RestClient.get(
          "#{Rails.application.config.engines_system_core_url}/#{command}",
          access_token: :test_token_arandy), opts
      rescue => e
        Rails.logger.warn "Engines System API get failed: #{e}"
        raise
      end

      def post(command, params={}, opts={})
        RestClient.post(
          "#{Rails.application.config.engines_system_core_url}/#{command}",
          {api_vars: params, access_token: :test_token_arandy} )
      rescue => e
        Rails.logger.warn "Engines System API post failed: #{e}"
        raise
      end

      def delete(command, params={}, opts={})
        RestClient.delete(
        "#{Rails.application.config.engines_system_core_url}/#{command}",
        {api_vars: params, access_token: :test_token_arandy} )
      rescue => e
        Rails.logger.warn "Engines System API delete failed: #{e}"
        raise
      end

      def parse(result, opts={})
        Rails.logger.info "Engines System API result: #{result}"
        case opts[:parse]
        when :json
          JSON.parse result, symbolize_names: true
        when :string
          result[1..-2] # remove leading and trailing quotation marks
        when :boolean
          result == 'true'
        else
          p :api_call_result_unparsed
          p result
          p result.class
          result
        end
      rescue => e
        Rails.logger.warn "Engines System API result parse #{opts[:parse]} failed: #{e}"
        raise
      end

    end
  end
end
