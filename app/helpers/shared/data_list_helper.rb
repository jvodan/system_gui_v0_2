module Shared
  module DataListHelper

    def data_list_text(label, text)
      content_tag(:dt) do
        label
      end +
      content_tag(:dd) do
        text.nil? ? '&nbsp;'.html_safe : text.to_s
      end
    end

    def data_list_array(label, text)
      content_tag(:dt) do
        label
      end +
      content_tag(:dd) do
        text.empty? ? 'None' :
          text.map{ |element| content_tag :p, element.to_s }.join.html_safe
      end
    end


  end
end
