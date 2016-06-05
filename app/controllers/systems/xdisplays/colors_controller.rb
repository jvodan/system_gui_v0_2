module Systems
  module Display
    class ColorsController < ApplicationController

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
          permit(:text_color, :background_color)
      end

    end
  end
end
