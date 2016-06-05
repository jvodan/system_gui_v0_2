module Systems
  module Display
    class IconsController < ApplicationController

      def edit
        @system = System.instance
      end

      def update
        @system = System.instance
        @system.update(strong_params)
      end

      # if @icon.update(system_display_setting_params)
      #   format.html { redirect_to system_path,
      #     notice: "Display settings were successfully updated." }
      # else
      #   format.html { render :edit }
      # end

      private

      def strong_params
        params.require(:system_settings_icon).permit(:icon, :icon_clear)
      end

    end
  end
end
