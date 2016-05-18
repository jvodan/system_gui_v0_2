module Navbar
  module PortalNavbarHelper

    def portal_navbar
      content_tag :nav, class: 'portal_navbar navbar navbar-default navbar-static-top' do
        content_tag :div, class: 'container-fluid' do
          content_tag(:div, class: 'navbar-header') do
            content_tag(:ul, portal_navbar_sub_links, class: 'nav navbar-nav navbar_collapsed') +
            navbar_brand_link
          end +
          content_tag(:div, class: 'collapse navbar-collapse') do
            content_tag(:ul, class: 'nav navbar-nav navbar-right') do
              portal_navbar_sub_links
            end
          end
        end
      end
    end

  end
end
