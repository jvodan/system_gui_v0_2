module Navbar
  module ApplicationNavbarHelper

    def application_navbar
      content_tag :nav, class: 'navbar navbar-default navbar-static-top' do
        content_tag :div, class: 'container-fluid' do
          content_tag(:div, class: 'navbar-header') do
            content_tag(:ul, application_navbar_sub_links, class: 'nav navbar-nav navbar_collapsed') +
            navbar_brand_link
          end +
          content_tag(:div, class: 'collapse navbar-collapse', id: 'navbar') do
            content_tag(:ul, class: 'nav navbar-nav') do
              # navbar_links if current_user
            end +
            content_tag(:ul, class: 'nav navbar-nav navbar-right') do
              application_navbar_sub_links
            end
          end
        end
      end
    end

  end
end
