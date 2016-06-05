class System
  module Resources

    def portal_apps
      apps.select(&:running?)
    end

    def domains
      core_system.list_domains.map(&:second).map do |domain|
        Systems::Domain.new(domain)
      end.sort_by(&:domain_name)
    end

    def libraries
      Systems::Library.all.order('name ASC').sort_by{ |library| library.id == 1 ? 1 : 2 }
    end

    def apps
      @apps ||=
      begin
        core_system.engine_states.map do |name, state|
          App.where(name: name).first_or_create.tap{ |app| app.state = state }
        end.sort_by &:name
      rescue => e
        Rails.logger.warn "Failed to get 'engines states' from Engines System API. #{e}"
        raise
      end
    end

    def services
      @services ||=
      begin
        core_system.service_states.map do |name, state|
          Service.new(name: name, state: state)
        end.sort_by &:name
      rescue => e
        Rails.logger.warn "Failed to get 'services states' from Engines System API. #{e}"
        raise
      end
    end


  end
end
