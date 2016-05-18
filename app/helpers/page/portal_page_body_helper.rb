module Page
  module PortalPageBodyHelper

    def portal_page_body(body)
      content_tag :div, class: 'container-fluid portal' do
        content_tag(:div,
            class: ('text-center' if @portal.center_align) ) do
              portal_header +
              content_tag(:p, body) +
              portal_footer
        end
      end
    end

    def portal_page_body_style
      "color: #{@portal.text_color}; background-color: #{@portal.background_color};"
    end

    def portal_header
      if @portal.header.present?
        content_tag :div, class: 'row' do
      		content_tag :div, class: 'col-sm-12' do
            markdown_text @portal.header
          end
        end
      else
        ''.html_safe
      end
    end

    def portal_footer
      if @portal.footer.present?
        content_tag :div, class: 'row' do
      		content_tag :div, class: 'col-sm-12' do
            markdown_text @portal.footer
          end
        end
      else
        ''.html_safe
      end
    end


  end
end
