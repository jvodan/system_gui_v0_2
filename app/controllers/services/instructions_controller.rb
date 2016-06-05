module System
  module Services
   class InstructionsController < ApplicationController

     def show
       @action_result = Service.find(params[:service_name]).core_service.send(params[:service_action])
     end

   end
  end
end
