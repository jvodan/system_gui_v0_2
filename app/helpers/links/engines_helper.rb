module Links
  module EnginesHelper

    def engine_action_link(engine, action, opts={})
      text = opts[:text] == false ? false : ( opts[:text] || "#{action.to_s.humanize}")
      icon = opts[:icon] == false ? false : opts[:icon]
      title = opts[:title] == false ? false : ( opts[:title] || "#{action.to_s.humanize} #{engine.to_s}" )
      html_class = opts[:class] || 'btn btn-lg btn_resource'
      case action.to_sym
      when :destroy
        destroy_resource_link engine,
          text: text, icon: icon, method: :get, title: title, class: html_class,
          url: engine_action_path(engine_id: engine.id, engine_action: :destroy)
      else
        resource_link engine,
          text: text, icon: icon, title: title, class: html_class,
          url: engine_action_path(engine_id: engine.id, engine_action: action)
      end
    end

  end
end
