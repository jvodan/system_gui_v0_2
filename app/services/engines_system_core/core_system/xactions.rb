module EnginesSystemCore
  class CoreSystem
    module Actions


      def build_app(params)
        post 'containers/engines/build', params
      end

      # def restart_system
      #   act 'system/control/base_os/restart'
      # end
      #
      # def restart_system(reason='No reason given.')
      #   act 'system/control/base_os/restart',
      #       method: :post, params: {reason: reason}
      # end
      #
      # def base_system_update
      #   act 'system/control/base_os/update'
      # end
      #
      # def engines_system_update
      #   get 'system/control/engines_system/update'
      # end
      #
      # def restart_mgmt
      #   act 'system/control/engines_system/restart'
      # end
      #
      # def recreate_mgmt
      #   act 'system/control/engines_system/recreate'
      # end
      #
      # def restart_registry
      #   act 'system/control/registry/restart'
      # end
      #
      # def abort_build
      #   act 'system_api.abort_build'
      # end

    end
  end
end
