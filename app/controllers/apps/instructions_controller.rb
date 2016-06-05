module Apps
 class InstructionsController < ApplicationController

   def show
     @app = App.find(params[:app_id])
     @action_result = @app.perform_action(params[:app_action])
   end

 end
end
