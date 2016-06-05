module Installers
  class BuildsController < ApplicationController

    def show
      @new_app = ::Installer::NewApp.find(params[:new_app_id])
    end

  end
end
