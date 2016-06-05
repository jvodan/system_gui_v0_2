module EnginesSystemCore
  class CoreSystem
    module Properties

      # def list_engines
      #   get api.list_apps, [].sort
      # end
      #
      # def list_services
      #   get api.list_services, [].sort
      # end

      def system_status
        get 'system/status', parse: :json
      end

      def system_events
        get 'system/events', parse: :json
      end

      def system_update_status
        get 'system_api.system_update_status', parse: :json
      end

      def list_domains
        get 'system/domains/', parse: :json
      end

      def domain(domain_name)
        get "system/domains/#{domain_name}", parse: :json
      end

      def update_domain(params)

p :update_params
p params

        post "system/domains/#{params[:domain_name]}", params, parse: :json
      end

      def add_domain(params)

p :new_params
p params

        post 'system/domains/domain_name', params, parse: :json
      end

      def remove_domain(params)

p :new_params
p params

        delete "system/domains/#{params[:domain_name]}"
      end


      def engine_states
        get 'containers/engines/state', parse: :json
      end

      def service_states
        get 'containers/services/state', parse: :json
      end

      def current_build_params
        get 'engine_builder/params', parse: :json
      end

      def last_build_params
        get 'engine_builder/last_build', parse: :json
      end

      def build_status
        get 'engine_builder/status', parse: :json
      end

      def remote_exception_logging?
        get_boolean system_api.is_remote_exception_logging?
      end

      def memory_statistics
        get 'system/metrics/memory/statistics', parse: :json
      end

      def memory_statistics_two
        get 'system/metrics/memory', parse: :json
      end

      def service_definition_for(publisher_namespace, type_path)
        get "service_manager/service_definitions/#{publisher_namespace}/#{type_path}", parse: :json
      end

      def persistent_service_connections_for(publisher_namespace, type_path)
        get "service_manager/persistent_services/#{publisher_namespace}/#{type_path}", parse: :json
      end

      def orphan_service_connections_for(publisher_namespace, type_path)
        get "service_manager/orphan_services/#{publisher_namespace}/#{type_path}", parse: :json
      end

      def engines_version
        get 'system/version/system'
      end

      def system_update_status
        get '', parse: :json
      end

      def base_system_version
        get 'system/version/base_os', parse: :json
      end

      def cpus_usage
        # Vmstat.snapshot
        get '/system/metrics/load', parse: :json
      end

      def disks_usage
        Vmstat.snapshot.disks
      end

      def network_interfaces_usage
        Vmstat.network_interfaces.reject{ |ni| ni[:name].to_s.include?('veth') || ni[:name].to_s.include?('lo') }
      end

      def base_os_data
        SystemUtils.get_os_release_data
      end

      def logs
        100.times.map{ |a| "log data."}.join("\n")
      end

    end
  end
end
