module EnginesSystemCore
  class CoreSystem

    # include Actions
    # include Loaders
    # include Properties

    include ContainerStates
    include DomainNames
    include EventStreams
    include InstallApps
    include Registries
    include ServiceConnections
    include Statistics
    include Versions
    include CoreApi::ApiCall

  end
end
