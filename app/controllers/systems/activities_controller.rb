module Systems
  class ActivitiesController < ApplicationController

    def show
      @activity = System::Activity.new
    end

  end
end
