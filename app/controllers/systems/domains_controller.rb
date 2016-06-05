module Systems
  class DomainsController < ApplicationController

    def index
    end

    def new
      @domain = Systems::Domain.new
    end

    def create
      @domain = Systems::Domain.new(strong_params)
      if @domain.add_to_system
        redirect_to '/system', notice: 'Successfully added domain.'
      else
        render 'new'
      end
    end

    def edit
      @domain = Systems::Domain.new(strong_params)
      @domain.load_details
    end

    def update
      @domain = Systems::Domain.new(strong_params)
      if @domain.update_system
        redirect_to '/system', notice: 'Successfully updated domain.'
      else
        render 'edit'
      end
    end

    def destroy
      @domain = Systems::Domain.new(strong_params)
      if @domain.remove_from_system
        redirect_to '/system', notice: 'Successfully deleted domain.'
      else
        render 'edit'
      end
    end

    private

    def strong_params
      params.require(:systems_domain).permit(:domain_name, :internal_only, :self_hosted)
    end

  end
end
