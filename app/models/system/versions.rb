class System
  module Versions

    def engines_version
      @apps_version ||=
      begin
        core_system.engines_version
      rescue => e
        errors.add(:base, "Failed to get 'engines version' from Engines System API. #{e}")
        raise
      end
    end

    def update_engines
      @apps_version ||=
      begin
        core_system.engines_system_update
      rescue => e
        errors.add(:base, "Failed to post 'engines system update' to Engines System API. #{e}")
        raise
      end
    end

    def base_system_version
      @base_system_version ||=
      begin
        core_system.base_system_version
      rescue => e
        errors.add(:base, "Failed to get 'base system version' from Engines System API. #{e}")
        raise
      end
    end

  end
end
