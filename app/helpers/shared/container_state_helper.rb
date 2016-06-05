module Shared
  module ContainerStateHelper

    def state_indicator_for(state)
      state = state.to_sym
      content_tag(:span, class: state_html_class_for(state), title: state_text_for(state)) do
        icon state_icon_for(state)
      end
    end

    def state_text_for(state)
      return 'Off' if state == :nocontainer
      state.to_s.humanize
    end

    def state_icon_for(state)
      case state
      when :nocontainer; 'fa-circle-o'
      when :running;     'fa-play'
      when :stopped;     'fa-stop'
      when :paused;      'fa-pause'
      else
        Rails.logger.debug "Not recognise state: #{state}"
        'fa-question'
      end
    end

    def state_html_class_for(state)
      "container_state_#{state.downcase}"
    end

  end
end
