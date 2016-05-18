module Systems
  module Display
    class AdminBannersController < ApplicationController

      def edit
        @system = System.instance
      end

      def update
        @system = System.instance
        @system.update(strong_params)
      end

      private

      def strong_params
        params.require(:system_settings_display).permit(:admin_banner)
      end

    end
  end
end
