module Systems
  class AdminsController < ApplicationController

    def show
      @admin = current_user
    end

  end
end
