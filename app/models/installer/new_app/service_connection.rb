class Installer
  class NewApp
    class ServiceConnection < ApplicationRecord

      belongs_to :new_app, optional: true

      # include ActiveModel::Model
      # include ActivePoro::Model

      # include ActiveModel::Validations

      def create_type_collection
        [ [:new, 'New'], [:existing, 'Share existing'], [:orphan, 'Adopt orphan'] ]
      end

      def existing_services_collection
        @existing_services_collection ||=
        system.persistent_service_connections_for(publisher_namespace, type_path).map do |service_connection|
          ["#{service_connection[:parent_engine]}##{service_connection[:service_handle]}", service_connection[:parent_engine]]
        end
      end

      def orphan_services_collection
        @orphan_services_collection ||=
        system.orphan_service_connections_for(publisher_namespace, type_path).map do |service_connection|
          ["#{service_connection[:parent_engine]}##{service_connection[:service_handle]}", service_connection[:parent_engine]]
        end
      end

      def service_definition
        @service_definition ||=
        system.service_definition_for(publisher_namespace, type_path)
      end

      def system
        @system ||= System.instance
      end

      def persistent?
        service_definition[:persistent]
      end

      def label
        "#{service_definition[:title]} - #{service_definition[:description]}"
      end

      def selected_service_connection
        if create_type.to_sym == :existing
          existing_service
        elsif create_type.to_sym == :orphan
          orphan_service
        else
          '#'
        end
      end

      def parent_app_for_selected
        selected_service_connection.split('#').first
      end

      def service_handle_for_selected
        selected_service_connection.split('#').last
      end



      # validates :create_type, inclusion: { in: create_type_collection.map(&:first) }


      # def initialize(opts)
      #   @publisher_namespace = opts[:publisher_namespace]
      #   @type_path = opts[:type_path]
      #   @create_type = opts[:create_type]
      # end

    end
  end
end
