module Systems
  class ChartsController < ApplicationController

    def show
      send_data(System::Usage.new.chart(params[:chart]), :filename => "engines_#{params[:chart]}.png", :type => 'image/png')
    end

  end
end
