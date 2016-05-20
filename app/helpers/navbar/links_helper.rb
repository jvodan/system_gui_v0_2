module Navbar
  module LinksHelper

    def navbar_brand_link
      link_to nil,
        class: 'navbar-brand',
        title: navbar_brand_text do
          navbar_brand_icon + navbar_brand_text
        end
    end

    def navbar_brand_text
      @system.label
    end

    def portal_navbar_sub_links
      content_tag(:li) do
        navbar_user_sign_out_link
      end +
      content_tag(:li) do
        portal_system_link
      end
    end

    def application_navbar_sub_links
      content_tag(:li) do
        navbar_network_link
      end +
      content_tag(:li) do
        # navbar_help_link
      end +
      content_tag(:li) do
        navbar_user_sign_out_link
      end +
      content_tag(:li) do
        system_portal_link
      end
    end

    def navbar_brand_icon
      return ''.html_safe if @system.icon.blank? || @system.icon.dirty?
      content_tag :div, class: 'navbar-icon pull-left' do
        image_tag @system.icon.url(:small)
      end
    end

    def navbar_help_link
			link_to icon('fa-question'), help_path(lookup: "#{params[:controller]}.#{params[:action]}.help"), title: 'Help', class: 'http_network_action'
    end

    def navbar_network_link
			link_to icon('fa-wifi'), connection_path, title: 'Connection', id: 'server_connection_status'
    end

    def navbar_user_sign_out_link
      if current_user
  			link_to icon('fa-sign-out'),
  				destroy_user_session_path,
          title: 'Sign out',
          class: 'http_network_action',
  				method: :delete
      end
    end

    def portal_system_link
      link_to icon('fa-cloud'), system_path, title: 'Manage Engines system', class: 'http_network_action'
    end

    def system_portal_link
      link_to icon('fa-close'), root_path, title: 'Close', class: 'http_network_action'
    end

  end
end
