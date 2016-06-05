class Installer
  class AppForm < Reform::Form

    property :label
    property :icon_url
    property :repository_url
    property :container_name
    property :host_name
    property :domain_name
    property :http_protocol
    property :memory
    property :recommended_memory
    property :required_memory
    property :license_sourceurl
    property :license_label
    property :license_accept

    collection :service_connections do
      property :publisher_namespace
      property :type_path
      property :create_type
    end

    validates :label, presence: true
    validates :container_name, presence: true
    validates :host_name, presence: true
    validates :domain_name, presence: true
    validates :http_protocol, presence: true
    validates :memory, presence: true
    validates :license_accept, presence: true

  end
end
