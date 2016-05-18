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
        get 'system/status', {}
      end

      def system_events
        get 'system/events', {}
      end

      def system_update_status
        get 'system_api.system_update_status', {}
      end

      def list_domains
        get system_api.list_domains, []
      end

      def engine_states
        get 'containers/engines/state', {}
      end

      def service_states
        get 'containers/services/state', {}
      end

      def current_build_params
        get 'engine_builder/params', {}
      end

      def last_build_params
        get 'engine_builder/last_build', {}
      end

      def build_status
        get 'engine_builder/status', {}
      end

      def remote_exception_logging?
        get system_api.is_remote_exception_logging?
      end

      def memory_statistics
        get system_api.get_memory_statistics
      end

      def engines_version
        get system_api.version_string
      end

      def engines_version
        get system_api.version_string
      end

      def base_system_name
        base_system_data['NAME']
      end

      def base_system_os_version
        base_system_data['VERSION']
      end

      def system_update_status
        SystemStatus.system_update_status
      end

      def base_system_data
        SystemUtils.get_os_release_data
      end

      def cpus_usage
        Vmstat.snapshot
        get '/system/metrics/load'
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
