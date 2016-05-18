module Systems
  class DisplaysController < ApplicationController

    def edit
      @system = System.instance
    end

    def update
      @system = System.instance
      @system.update(strong_params)
    end

    private

    def strong_params
      params.require(:system_settings_display).permit(
        :system_label, :admin_banner, :portal_header,
        :portal_footer, :text_color, :background_color, :icon_clear)
    end

  end
end
