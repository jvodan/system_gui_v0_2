module EnginesSystemCore
  class CoreSystem
    module States

      def engine_states
        CoreResult.new(:get, api.get_engines_states, {}).call
      end

      def service_states
        CoreResult.new(:get, api.get_services_states, {}).call
      end

    end
  end
end
