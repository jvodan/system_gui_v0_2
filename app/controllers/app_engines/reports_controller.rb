module AppEngines
  class ReportsController < ApplicationController

    def show
      @engine = AppEngine.find(params[:engine_id])
    end

  end
end
