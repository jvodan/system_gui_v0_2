module System
  module Services
   class ControlPanelsController < ApplicationController

     def show
       @service = Service.find(params[:service_name])
     end

   end
  end
end
