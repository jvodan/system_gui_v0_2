module Portal
  class EnginesController < ApplicationController

    def show
      @engine = Engine.find(params[:id])
    end

  end
end
