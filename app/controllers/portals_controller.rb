class PortalsController < ApplicationController

  def show
    @portal = @system.portal_for(current_user)
  end

end
