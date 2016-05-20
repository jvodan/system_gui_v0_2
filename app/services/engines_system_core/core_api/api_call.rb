module EnginesSystemCore
  module CoreApi
    module ApiCall

      def get_boolean(command, default='false')
        api_call(:get, command, default).call.to_bool
      end

      def get_string(command, default='')
        api_call(:get, command, default)
      end

      def get_array(command, default='[]')
        JSON.parse api_call(:get, command, default)
      end

      def get_hash(command, default='{}')
        JSON.parse api_call(:get, command, default)
      end

      def post(command)
        api_call(:post, command)
      end

      # def core_act(command)
      #   CoreResult.new(:do, EnginesSystemCore::CoreSystem.new.api.send(method, command, name)).call
      # end

      def api_call(method, command, default=nil)
        result = RestClient.get("#{Rails.application.config.engines_system_core_url}/#{command}", access_token: :test_token_arandy)
        result ? CoreApi::Result.new(method, result, default).call : default
      rescue => e
        Rails.logger.warn "Engines System API call failed: #{e}"
        default
      end

    end
  end
end
