module AppEngines
  class ControlPanelsController < ApplicationController

    def show
      @engine = AppEngine.find(params[:engine_id])
    end

  end
end
