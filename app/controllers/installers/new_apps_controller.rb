module Installers
  class NewAppsController < ApplicationController

    def new
      @new_app = ::Installer::NewApp.new(strong_params).set_defaults
      # render plain: @new_app.repository.inspect
      # App.new(new_params)
      #   first_or_create.clear.assign_attributes(strong_params).load_blueprint
      # if @repository.source_blueprint.nil?
      #   redirect_to installers_library_path(library_id: params[:library_id]),
      #       alert: "Could not load blueprint from #{params[:repository_url]}."
      # elsif @repository.blueprint.nil?
      #   redirect_to installers_library_path(library_id: params[:library_id]),
      #       alert: "Invalid blueprint loaded from #{params[:repository_url]}."
      # end
      # @installer_app = @repository.build_app.prepopulate
      # render plain: @new_app.inspect
    end

    def create
      @new_app = ::Installer::NewApp.create(strong_params)
      if @new_app.install
        redirect_to installers_build_path(new_app_id: @new_app.id)
      else
        render 'new'
      end
    end

    private

    # def new_params
    #   params.require(:installer_app).permit(
    #     :app_label, :app_icon_url, :repository_url, :library_id)
    # end

    # def return_path
    #   return system_path unless new_params[:library_id]
    #   installers_library_path(new_params[:library_id])
    # end

    def strong_params
      params.require(:installer_new_app).permit(
        :repository_id,
        :label, :container_name, :host_name, :domain_name, :http_protocol,
        :icon_url, :license_label, :license_sourceurl,
        :memory, :required_memory, :recommended_memory, :license_accept,
        service_connections_attributes: [
          :publisher_namespace, :type_path,
          :create_type, :existing_service, :orphan_service ],
        environment_variables_attributes: [
          :mandatory, :immutable,
          :ask_at_build_time, :build_time_only,
          field_attributes: [
            :value, :method_name, :as,
            :label, :title,
            :horizontal, :compact,
            :left, :width, :right,
            :collection,
            :placeholder, :comment, :tooltip, :hint,
            :validate_regex, :validate_invalid_message,
            :depends_on_field, :depends_on_regex,
            :required, :read_only ] ] )
    end

  end
end
