module Links
  module ServicesHelper

    def service_action_link(service, action, opts={})
      text = opts[:text] == false ? false : ( opts[:text] || "#{action.to_s.humanize}")
      icon = opts[:icon] == false ? false : opts[:icon]
      title = opts[:title] == false ? false : ( opts[:title] || "#{action.to_s.humanize} #{service.to_s}" )
      html_class = opts[:class] || 'btn btn-lg'
      case action.to_sym
      when :destroy
        destroy_resource_link service,
          text: text, icon: icon, method: :get, title: title, class: html_class,
          url: system_service_instruction_path(service_name: service.name, service_action: :destroy)
      else
        resource_link service,
          text: text, icon: icon, title: title, class: html_class,
          url: system_service_instruction_path(service_name: service.name, service_action: action)
      end
    end

  end
end
