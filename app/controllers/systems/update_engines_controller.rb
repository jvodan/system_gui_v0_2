module Systems
  class UpdateEnginesController < ApplicationController

    def show
      @apps_update = @system.update_engines
      # render js: "alert('#{@system.update_engines}');"
    end

  end
end
