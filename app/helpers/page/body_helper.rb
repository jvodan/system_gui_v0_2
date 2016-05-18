module Page
  module BodyHelper

    def page_body(body)
      content_tag :body, style: page_body_style do
        page_body_content(body)
      end
    end

    def page_body_content(body)
      return portal_page_body(body) if controller_name == 'portals'
      content_tag :div, class: 'container' do
        flash_messages +
        body
      end
    end

    def page_body_style
      portal_page_body_style if controller_name == 'portals'
    end

  end
end
