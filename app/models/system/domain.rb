class System
  class Domain

    include ActiveModel::Model
    include ActiveModel::Validations

    attr_accessor :domain_name, :self_hosted, :internal_only

    def to_s
      domain_name
    end

  end
end
