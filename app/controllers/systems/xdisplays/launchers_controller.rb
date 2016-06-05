module Systems
  module Display
    class PortalsController < ApplicationController

      def edit
        @system = System.instance
      end

      def update
        @system = System.instance
        @system.update(strong_params)
      end

      private

      def strong_params
        params.require(:system_settings_display).
          permit(:portal_header, :portal_footer)
      end

    end
  end
end
