module Systems
  class Domain

    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :domain_name, :self_hosted, :internal_only

    def to_s
      domain_name
    end

    def load_details
      assign_attributes(core_system.load_domain domain_name: domain_name)
    end

    def update_system
      core_system.update_domain domain_params
    end

    def add_to_system
      core_system.add_domain domain_params
    end

    def remove_from_system
      core_system.remove_domain domain_name: domain_name
    end

    def domain_params
      { domain_name: domain_name,
        internal_only: internal_only == '1',
        self_hosted: self_hosted == '1' }
    end

    def core_system
      @core_system ||= System.instance.core_system
    end

  end
end
