module Systems
  class Registry

    require 'yajl'


    def tree
      @tree ||= {name: "Registry", content: "Engines system registry", children: nodes}
    end

    def nodes
      [].tap do |tree|
        tree << core_system.registry_configurations
        tree << core_system.registry_apps
        tree << core_system.registry_services
        tree << core_system.registry_orphans
        tree << core_system.registry_shares
      end
    end

    def core_system
      @core_system ||=
      System.instance.core_system
    end

  end
end
