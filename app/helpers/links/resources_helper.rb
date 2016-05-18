module Links
  module ResourcesHelper

    def resource_link(resource, opts={})
      text = opts[:text] || "#{resource.to_s}" unless opts[:text] == false
      icon = opts[:icon] || 'fa-angle-right' unless opts[:icon] == false
      title = opts[:title] || "#{resource.to_s}" unless opts[:title] == false
      url = opts[:url] || url_for([resource])
      remote = opts[:remote] != false
      html_class = opts[:class] || 'btn btn-lg btn_resource'
      html_class = html_class + ' http_network_action' if !remote
      button_to(url, method: :get,
        title: title, remote: remote, class: html_class) do
          icon_text(text, icon)
        end
    end

    def edit_resource_link(resource, opts={})
      text = opts[:text] || "Edit #{resource.to_s}" unless opts[:text] == false
      icon = opts[:icon] || 'fa-edit' unless opts[:icon] == false
      title = opts[:title] || "Edit #{resource.to_s}" unless opts[:title] == false
      url = opts[:url] || url_for([:edit, resource])
      remote = opts[:remote] != false
      html_class = opts[:class] || 'btn btn-lg btn_resource'
      button_to url, method: :get,
        title: title, remote: remote, class: html_class do
          icon_text(text, icon)
        end
    end

    def destroy_resource_link(resource, opts={})
      text = opts[:text] || "Destroy #{resource.to_s}"
      icon = opts[:icon] || 'fa-trash-o'
      title = opts[:title] || "Destroy #{resource.to_s}"
      url = opts[:url] || url_for([resource])
      confirm_opts = opts[:confirm] || {}
      confirm_text = confirm_opts[:text] || "Are you sure that you want to destroy #{resource.to_s}?"
      confirm_title_opts = confirm_opts[:title] || {}
      confirm_title_text = confirm_title_opts[:text] || "Confirm destroy"
      confirm_title_icon = confirm_title_opts[:icon] || 'fa-warning'
      confirm_title = icon_text(confirm_title_text, confirm_title_icon).gsub('"',"'")
      confirm_disabled_text = confirm_opts[:disabled_text] || 'Destroying'
      confirm_disabled_icon = confirm_opts[:disabled_icon] || 'fa-hourglass-o'
      disable_with = icon_text(confirm_disabled_text, confirm_disabled_icon)
      remote = opts[:remote] != false
      method = opts[:method] || :delete
      html_class = opts[:class] || 'btn btn-lg btn_resource'
      button_to url, method: method,
        title: title, remote: remote, class: html_class,
        disable_with: disable_with,
        'data-confirm': confirm_text,
        'data-confirm-title': confirm_title,
        'data-confirm-cancel-class': 'btn-warning pull-left',
        'data-confirm-proceed-class': 'btn-danger',
        'data-confirm-cancel': icon_text('Cancel', 'fa-times'),
        'data-confirm-proceed': icon_text('Destroy', 'fa-exclamation'),
        'data-confirm-fade': true do
          icon_text(text, icon)
        end
    end


    # def index_resources_link(model_name, opts={})
    #   text = opts[:text] || "#{model_name.pluralize.labelize}"
    #   icon = opts[:icon] || 'fa-angle-double-right'
    #   title = opts[:title] || "Index #{text}"
    #   remote = opts[:remote] != false
    #   html_opts = opts[:html_opts]
    #   link_to(
    #     icon_text(text, icon),
    #     url_for([model_name.to_s.pluralize]),
    #     html_opts.merge( {title: title, 'data-remote': remote} ) )
    # end
    #
    # def vs_show_object_link(object, opts={})
    #   text = evaluate_spec_value opts[:text], "#{object.to_label}"
    #   icon = evaluate_spec_value opts[:icon], 'fa-angle-right'
    #   title = evaluate_spec_value opts[:title], "Show #{object.to_s}"
    # html_opts = opts[:html_opts]
    #   js_page_context = opts[:js_page_context]
    #   link_to(
    #     vs_icon_text(text, icon),
    #     url_for([object, js_page_context: js_page_context]),
    #     html_opts.merge( {title: title} ) )
    # end
    #
    # def vs_edit_object_link(object, opts={})
    #   text = evaluate_spec_value opts[:text], "Edit #{object.to_s}"
    #   icon = evaluate_spec_value opts[:icon], 'fa-edit'
    #   title = evaluate_spec_value opts[:title], "Edit #{object.to_s}"
    # html_opts = opts[:html_opts]
    #   js_page_context = opts[:js_page_context]
    #   link_to(
    #     vs_icon_text(text, icon),
    #     url_for([:edit, object, js_page_context: js_page_context]),
    #     html_opts.merge( {title: title} ) )
    # end
    #
    #
    # # def vs_delete_object_link(object, opts={})
    # #   text = evaluate_spec_value opts[:text], "Delete #{object.to_s}"
    # #   icon = evaluate_spec_value opts[:icon], 'fa-trash-o'
    # #   title = evaluate_spec_value opts[:title], vs_icon_text("Delete #{object.to_s}", icon).html_safe
    # html_opts = opts[:html_opts]
    # #   confirm = evaluate_spec_value opts[:confirm], "Are you sure that you want to delete #{object.to_label}?"
    # #   js_page_context = opts[:js_page_context]
    # #   link_to(
    # #     vs_icon_text(text, icon),
    # #     url_for([object, js_page_context: js_page_context]),
    # #     html_opts.merge(
    # #       { method: :delete,
    # #         data: ( html_opts[:data] || {} ).
    # #                   merge( { confirm: confirm } ),
    # #         title: title, cancel: {class: 'btn-warning pull-left'} } ) )
    # # end
    #
    #
    # def vs_new_object_link(model_name, opts={})
    #   text = evaluate_spec_value opts[:text], "New #{model_name.humanize}"
    #   icon = evaluate_spec_value opts[:icon], 'fa-plus'
    #   title = evaluate_spec_value opts[:title], "New #{model_name.humanize}"
    # html_opts = opts[:html_opts]
    #   parent =  { model_name =>
    #               { "#{opts[:parent].class.name.underscore}_id" =>
    #                   opts[:parent].id } } if opts[:parent]
    #   js_page_context = opts[:js_page_context]
    #   link_to(
    #     vs_icon_text(text, icon),
    #     url_for(
    #       [ :new,
    #         model_name,
    #         { js_page_context: js_page_context }.merge(parent || {}) ] ),
    #         html_opts.merge( {title: title} ) )
    # end
    #
    #
    # def vs_modal_form_cancel_link(opts={})
    #   text = evaluate_spec_value opts[:text], 'Cancel'
    #   icon = evaluate_spec_value opts[:icon], 'fa-times'
    #   title = evaluate_spec_value opts[:title], "Cancel #{action_name} form"
    # html_opts = opts[:html_opts]
    #   link_to(
    #     vs_icon_text(text, icon),
    #     'javascript:;',
    #     html_opts.merge(
    #       { type: :button,
    #         data: ( html_opts[:data] || {} ).merge(
    #                 { dismiss: :modal } ),
    #         title: title } ) )
    # end

  end
end
