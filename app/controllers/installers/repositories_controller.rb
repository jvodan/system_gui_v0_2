module Installers
  class RepositoriesController < ApplicationController

    def new
      @repository = ::Installer::Repository.create(strong_params)
      if @repository.load_blueprint
        redirect_to new_installers_new_app_path(installer_new_app: { repository_id: @repository.id })
      else
        redirect_to return_path,
            alert: "Could not load blueprint from #{strong_params[:repository_url]}. #{@repository.errors[:base].join(' ')}"
      end
      #
      # if @repository.raw_blueprint.nil?
      #   redirect_to return_path,
      #       alert: "Could not load blueprint from #{strong_params[:repository_url]}."
      # elsif @repository.blueprint.nil?
      #   redirect_to return_path,
      #       alert: "Invalid blueprint loaded from #{strong_params[:repository_url]}."
      # else
      # end
    end

    def strong_params
      params.require(:installer_repository).permit(
        :app_label, :app_icon_url, :repository_url, :library_id)
    end

    def return_path
      return system_path unless strong_params[:library_id]
      installers_library_path(strong_params[:library_id])
    end

  end
end
