module Shared
  module StatusHelper

    def status_indicator_for(status)
      content_tag :span, class: status_html_class_for(status), title: status_text_for(status) do
        icon status_icon_for(status)
      end
    end

    def status_text_for(status)
      return 'Off' if status == :nocontainer
      status.to_s.humanize
    end

    def status_icon_for(status)
      case status
      when :nocontainer; 'fa-circle-o'
      when :running;     'fa-play'
      when :stopped;     'fa-stop'
      when :paused;      'fa-pause'
      else;              'fa-circle'
      end
    end

    def status_html_class_for(status)
      "container_status_#{status.downcase}"
    end

  end
end
