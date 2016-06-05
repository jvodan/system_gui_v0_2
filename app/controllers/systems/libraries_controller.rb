module Systems
  class LibrariesController < ApplicationController

    def index
    end

    def new
      @library = Systems::Library.new
    end

    def create
      @library = Systems::Library.new(strong_params)
      if @library.save
        redirect_to '/system', notice: 'Successfully added library.'
      else
        render 'new'
      end
    end

    def edit
      @library = Systems::Library.find(params[:id])
    end

    def update
      @library = Systems::Library.find(params[:id])
      if @library.update(strong_params)
        redirect_to '/system', notice: 'Successfully updated library.'
      else
        render 'edit'
      end
    end

    def destroy
      @library = Systems::Library.find(params[:id])
      if @library.destroy
        redirect_to '/system', notice: 'Successfully deleted library.'
      else
        redirect_to '/system', alert: 'Failed to delete library.'
      end
    end

    private

    def strong_params
      params.require(:systems_library).permit(:name, :url)
    end

  end
end
