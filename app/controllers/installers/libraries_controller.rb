module Installers
  class LibrariesController < ApplicationController

    def show
      # render plain: request.inspect
      @library = Systems::Library.find(params[:library_id])
    end

  end
end
