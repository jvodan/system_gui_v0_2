module EnginesSystemCore
  class CoreSystem
    module InstallApps

      def build_app(params)
        post 'containers/engines/build', params, parse: :boolean
      end

    end
  end
end
