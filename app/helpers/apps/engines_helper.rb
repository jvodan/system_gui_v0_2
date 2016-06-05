module Apps
  module EnginesHelper

    def app_action_link(app, action, opts={})
      text = opts[:text] == false ? false : ( opts[:text] || "#{action.to_s.humanize}")
      icon = opts[:icon] == false ? false : opts[:icon]
      title = opts[:title] == false ? false : ( opts[:title] || "#{action.to_s.humanize} #{app.to_s}" )
      html_class = opts[:class] || 'btn btn-lg btn_resource'
      case action.to_sym
      when :destroy
        destroy_resource_link app,
          text: text, icon: icon, method: :get, title: title, class: html_class,
          url: app_instruction_path(app_id: app.id, app_action: :destroy)
      else
        resource_link app,
          text: text, icon: icon, title: title, class: html_class,
          url: app_instruction_path(app_id: app.id, app_action: action)
      end
    end

  end
end
