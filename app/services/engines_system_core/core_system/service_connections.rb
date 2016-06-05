module EnginesSystemCore
  class CoreSystem
    module ServiceConnections

      def service_definition_for(publisher_namespace, type_path)
        get "service_manager/service_definitions/#{publisher_namespace}/#{type_path}", parse: :json
      end

      def persistent_service_connections_for(publisher_namespace, type_path)
        get "service_manager/persistent_services/#{publisher_namespace}/#{type_path}", parse: :json
      end

      def orphan_service_connections_for(publisher_namespace, type_path)
        get "service_manager/orphan_services/#{publisher_namespace}/#{type_path}", parse: :json
      end

    end
  end
end
