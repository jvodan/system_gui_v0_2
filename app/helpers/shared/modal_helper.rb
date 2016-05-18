module Shared
  module ModalHelper

    def modal(body_or_opts=nil, opts={}, &block)
      if block_given?
        opts = body_or_opts
        body = capture(&block)
      else
        body = body_or_opts
      end
      content_tag(:div, id: opts[:id], class: "modal #{'fade' if opts[:fade]}", tabindex:'-1') do
        content_tag(:div, class: "modal-dialog #{'modal-lg' if opts[:large]}") do
          content_tag(:div, class: 'modal-content') do
            content_tag(:div, class: 'modal-header') do
              modal_dismiss_header_button +
              (modal_header(opts[:header]) if opts[:header])
            end +
            content_tag(:div, nil, id: "#{opts[:id]}_flash_messages") +
            content_tag(:div, class: 'modal-body') do
              body
            end +
            if opts[:footer_close]
              modal_dismiss_footer
            end.to_s.html_safe
          end
        end
      end
    end

    def modal_header(text_or_opts, opts={})
      if text_or_opts.is_a? String
        text = text_or_opts
      else
        text = text_or_opts[:text]
        opts = text_or_opts
      end
      return opts[:html] if opts[:html]
      icon = opts[:icon] || 'fa-angle-right'
      subtext = opts[:subtext]
      title = opts[:title]
      content_tag :div, class: 'modal-title', title: title do
        [ icon_text(text, icon),
          content_tag(:small, subtext) ].
          join(' ').html_safe
      end
    end


    def modal_dismiss_header_button
      content_tag(
        :button,
        type: :button, class: 'close',
        title: 'Close',
        data: { dismiss: :modal } ) do
          content_tag :span, '&times;'.html_safe
        end
    end

    def modal_dismiss_footer
      content_tag(:div, class: 'modal-footer modal_dismiss_footer', data: { dismiss: :modal }) do
        icon_text('Close', 'fa-times')
      end
    end

  end
end
