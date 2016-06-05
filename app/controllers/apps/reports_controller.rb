module Apps
  class ReportsController < ApplicationController

    def show
      @app = App.find(params[:app_id])
    end

  end
end
