class Installer
  class NewApp < ApplicationRecord

    # before_create :set_defaults

    self.table_name = :installer_new_apps

    belongs_to :repository
    has_many :service_connections, dependent: :destroy
    has_many :environment_variables, dependent: :destroy
    accepts_nested_attributes_for :service_connections
    accepts_nested_attributes_for :environment_variables

    validates :label, presence: true, on: :create
    validates :container_name, presence: true, on: :create
    validates :host_name, presence: true, on: :create
    validates :domain_name, presence: true, on: :create
    validates :http_protocol, presence: true, on: :create
    validates :memory, presence: true, on: :create
    validates :license_accept, acceptance: { message: [['License', 'must be accepted']] }, on: :create

    def set_defaults
      self.container_name = available_name_for blueprint[:name]
      self.label = repository.app_label || container_name.humanize
      self.host_name = container_name
      self.domain_name = System.instance.default_domain
      self.http_protocol = blueprint_http_protocol
      self.memory = blueprint[:recommended_memory] || blueprint[:required_memory]
      self.license_accept = false
      # blueprint_services.each { |blueprint_service| service_connections.build(blueprint_service) }
      service_connections.build(blueprint_services)
      environment_variables.build(templated_environment_variables)
      self
    end

    def blueprint
      repository.blueprint
    end

    def available_name_for(default_name)
      name = default_name
      index = 2
      while reserved_names.include? name do
        max_base_length = 16 - index.to_s.length
        name = default_name.first(max_base_length) + index.to_s
        index += 1
      end
      name
    end

    def reserved_names
      [] #need from api reserved_container_names + reserved_host_names
    end

    def blueprint_http_protocol
      [:http, :https, :http_https].include?(blueprint[:http_protocol]) ?
        blueprint[:http_protocol] : :http_https
    end

    def blueprint_services
      service_configurations = blueprint[:service_configurations]
      return [] unless service_configurations.present?
      service_configurations.map do |service_configuration|
        { publisher_namespace: service_configuration[:publisher_namespace],
          type_path: service_configuration[:type_path],
          create_type: :new }
      end
    end

    def templated_environment_variables
      environment_variables = blueprint[:variables]
      return [] unless environment_variables.present?
      environment_variables.map do |environment_variable|
        {
          ask_at_build_time: environment_variable[:ask_at_build_time],
          build_time_only: environment_variable[:build_time_only],
          field_attributes: {
            method_name: environment_variable[:name],
            value: environment_variable[:value],
            label: environment_variable[:label],
            as: environment_variable[:as] || environment_variable[:field_type],
            title: environment_variable[:title],
            collection: environment_variable[:collection] || environment_variable[:select_collection],
            tooltip: environment_variable[:tooltip],
            hint: environment_variable[:hint],
            placeholder: environment_variable[:placeholder],
            comment: environment_variable[:comment],
            validate_regex: environment_variable[:validate_regex],
            validate_invalid_message: environment_variable[:validate_invalid_message],
            depends_on_field: environment_variable[:depends_on_field],
            depends_on_regex: environment_variable[:depends_on_regex],
            required: environment_variable[:mandatory],
            read_only: environment_variable[:immutable]
          }
        }
      end
    end

    def install
      begin
        save # && core_system.build_app(app_install_params)
      rescue => e
        Rails.logger.warn "Failed to send 'build app' to Engines System API. #{e}"
        raise
      end
    end

    def app_install_params
      @app_install_params ||=
      { engine_name: container_name,
        host_name: host_name,
        domain_name: domain_name,
        http_protocol: http_protocol.to_s,
        memory: memory,
        variables: variables_install_params,
        attached_services: service_connection_install_params,
        repository_url: repository.repository_url }
      end

      def variables_install_params
        {}.tap do |result|
          environment_variables.each do |variable|
            result[variable.field.method_name] = variable.field.value
          end
        end
      end

      def service_connection_install_params
        service_connections.map do |service_connection|
          { type_path: service_connection.type_path,
            publisher_namespace: service_connection.publisher_namespace,
            create_type: service_connection.create_type,
            parent_engine: service_connection.parent_app_for_selected,
            service_handle: service_connection.service_handle_for_selected }
        end
      end

      def core_system
        System.instance.core_system
      end
  end
end
