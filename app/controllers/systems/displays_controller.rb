module Systems
  class DisplaysController < ApplicationController

    # def show
    #
    # end

    def edit
    end

    def update
      if @system.update(strong_params)
        redirect_to system_path, notice: 'System display settings were successfully updated.'
      else
        render 'edit'
      end
    end

    private

    def strong_params
      params.require(:system).permit(
        :label, :admin_banner, :portal_center_align, :portal_header,
        :portal_footer, :text_color, :background_color, :icon_clear)
    end

  end
end
