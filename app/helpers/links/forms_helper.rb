module Links
  module FormsHelper

    def form_submit_link(text_or_opts=nil)
      if text_or_opts.is_a? String
        opts = {text: text_or_opts}
      else
        opts = text_or_opts
      end
      text = opts[:text] || 'Submit' unless opts[:text] == false
      icon = opts[:icon] || 'fa-check' unless opts[:icon] == false
      title = opts[:title] || "Submit #{action_name} form" unless opts[:title] == false
      html_opts = opts[:html_opts] || { class: 'btn btn-primary pull-right' }
      disabled_text = opts[:disabled_text] || 'Submitting'
      disabled_icon = opts[:disabled_icon] || 'fa-hourglass-o'
      html_opts = html_opts.merge(
          { type: :submit,
            data: ( html_opts[:data] || {} ).merge(
                    { disable_with:
                        icon_text(
                          disabled_text, disabled_icon) } ),
            title: title } )
      button_tag html_opts do
        icon_text(text, icon)
      end
    end

    def form_cancel_link(opts={})
      text = opts[:text] || 'Cancel' unless opts[:text] == false
      icon = opts[:icon] || 'fa-times' unless opts[:icon] == false
      title = opts[:title] || "Cancel #{action_name} form" unless opts[:title] == false
      url = opts[:url]
      html_opts = opts[:html_opts] || { class: 'btn btn-warning pull-left' }
      html_opts.merge!(
        { type: :button,
          data: ( html_opts[:data] || {} ).merge(
                  ( { dismiss: :modal } unless url ) || {} ),
          title: title } )
      if url
        link_to(icon_text(text, icon), url, html_opts)
      else
        button_tag(icon_text('Close', 'fa-times'), html_opts)
      end
    end

  end
end
