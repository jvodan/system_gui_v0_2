module Page
  module PortalPageBodyHelper

    def portal_page_body(body)
      content_tag :div, class: 'container-fluid portal' do
        content_tag(:div,
            class: ('text-center' if @system.portal_center_align) ) do
              flash_messages +
              portal_header +
              content_tag(:p, body) +
              portal_footer
        end
      end
    end

    def portal_page_body_style
      "color: #{@system.text_color}; background-color: #{@system.background_color};"
    end

    def portal_header
      if @system.portal_header.present?
        content_tag :div, class: 'row' do
      		content_tag :div, class: 'col-sm-12' do
            markdown_text @system.portal_header
          end
        end
      else
        ''.html_safe
      end
    end

    def portal_footer
      if @system.portal_footer.present?
        content_tag :div, class: 'row' do
      		content_tag :div, class: 'col-sm-12' do
            markdown_text @system.portal_footer
          end
        end
      else
        ''.html_safe
      end
    end


  end
end
