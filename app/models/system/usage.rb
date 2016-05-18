class System
  class Usage

    def chart(chart_method)
      EnginesSystemCore::Charts.new.send(chart_method)
    end

  end
end
