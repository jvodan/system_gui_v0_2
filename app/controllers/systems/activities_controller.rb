module Systems
  class ActivitiesController < ApplicationController

    def show
      @activity = Systems::Activity.new
    end

  end
end
