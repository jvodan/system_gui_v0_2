module AppEngines
 class ActionsController < ApplicationController

   def show
     @engine = AppEngine.find(params[:engine_id])
     @action_result = @engine.core_engine.send(params[:engine_action])
   end

 end
end
