module Apps
 class DisplaysController < ApplicationController

   def edit
     @app = App.find(params[:app_id])
   end

   def update
     @app = App.find(params[:app_id])
     if @app.update(strong_params)
       redirect_to system_path, notice: "Display settings for #{@app.name} were successfully updated."
     else
       render 'edit'
     end
   end

   private

   def strong_params
     params.require(:app).permit(
       :label, :title, :portal_show, :icon, :icon_clear)
   end

 end
end
