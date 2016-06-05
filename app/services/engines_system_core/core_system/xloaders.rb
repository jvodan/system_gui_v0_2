module EnginesSystemCore
  class CoreSystem
    module Loaders

      def load_engine(name)
        get system_api.loadManagedEngine(name)
      end

      def load_service(name)
        get system_api.getManagedService(name)
      end

    end
  end
end
