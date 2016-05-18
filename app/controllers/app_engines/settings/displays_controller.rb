module AppEngines
  module Settings
   class DisplaysController < ApplicationController

     def edit
       @engine = Engine.find(params[:engine_id])
     end

     def update
       @engine = Engine.find(params[:engine_id])
       @engine.update(strong_params)
       # respond_to &js
     end

     private

     def strong_params
       params.require(:engine_settings_display).permit(
         :label, :icon, :icon_clear)
     end

   end
 end
end
