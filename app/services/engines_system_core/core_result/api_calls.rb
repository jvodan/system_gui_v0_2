module EnginesSystemCore
  module CoreResult
    module ApiCalls

      def get(method, default=nil)
        CoreResult::Result.new(:get, api_call(method), default).call
      end

      def act(method)
        CoreResult::Result.new(:act, api_call(method)).call
      end

      # def core_act(method)
      #   CoreResult.new(:do, EnginesSystemCore::CoreSystem.new.api.send(method, name)).call
      # end

      def api_call(method)
        RestClient.get "#{Rails.application.config.engines_system_core_url}/#{method}", access_token: :test_token_arandy
      rescue => e
        Rails.logger.warn "Engines System API call failed: #{e}"
        nil
      end

    end
  end
end
