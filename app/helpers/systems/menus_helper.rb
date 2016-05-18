module Systems
  module MenusHelper

    def system_menu
      system_menu_link +
      system_menu_modal +
      system_certificate_menu_modal +
      system_key_menu_modal +
      system_control_panel_menu_modal
    end

    def system_menu_link
      content_tag :div, class: 'display_inline pull_right_wide_media' do
        content_tag :button, title: 'System menu', class: 'btn btn-lg btn_resource', type: 'button', 'data-toggle': :modal, 'data-target': '#system_menu_modal' do
          icon 'fa-bars'
        end
      end
    end

    def back_to_system_menu_link
      content_tag :div, class: 'clearfix' do
        content_tag :button, title: 'Back to system menu', class: 'btn btn-lg btn_resource pull_right_wide_media', type: 'button', 'data-dismiss': :modal, 'data-toggle': :modal, 'data-target': '#system_menu_modal' do
          icon 'fa-arrow-up'
        end
      end
    end

    def back_to_system_control_panel_menu_link
      content_tag :div, class: 'clearfix' do
        content_tag :button, title: 'Back to system control panel menu', class: 'btn btn-lg btn_resource pull_right_wide_media', type: 'button', 'data-dismiss': :modal, 'data-toggle': :modal, 'data-target': '#system_control_panel_menu_modal' do
          icon 'fa-arrow-up'
        end
      end
    end

    def system_menu_modal
      modal(header: {text: "System menu", icon: 'fa-bars'}, footer_close: true, id: "system_menu_modal") do
          system_install_link +
          content_tag(:hr) +
          system_activity_link +
          content_tag(:hr) +
          content_tag(:div, class: 'display_inline') do
            content_tag(:span, "Engines (#{@system.core_system.engines_version})", class: 'dropdown-header') +
            system_update_engines_link
          end +
          content_tag(:div, class: 'display_inline') do
            content_tag(:span, "#{@system.core_system.base_system_name} (#{@system.core_system.base_system_os_version})", class: 'dropdown-header') +
            system_update_base_os_link
          end +
          content_tag(:hr) +
          system_control_panel_menu_link
      end
    end

    def system_control_panel_menu_link
      content_tag :div do
        content_tag :button, title: 'Control panel menu', class: 'btn btn-lg btn_resource', type: 'button', 'data-dismiss': :modal, 'data-toggle': :modal, 'data-target': '#system_control_panel_menu_modal' do
          icon_text 'Control panel', 'fa-cogs'
        end
      end
    end

    def system_control_panel_menu_modal
      modal(header: {text: 'System control panel', icon: 'fa-cogs'}, footer_close: true, id: 'system_control_panel_menu_modal') do
        back_to_system_menu_link +
        system_users_link +
        system_services_link +
        system_domains_link +
        system_libraries_link +
        content_tag(:hr) +
        system_certificate_menu_link +
        system_key_menu_link +
        content_tag(:hr) +
        system_report_link +
        system_registry_link +
        system_logs_link +
        system_bugs_link +
        content_tag(:hr) +
        system_reboot_link
      end
    end

    def system_certificate_menu_link
      content_tag :div do
        content_tag :button, title: 'Upload/download certificate', class: 'btn btn-lg btn_resource', type: 'button', 'data-dismiss': :modal, 'data-toggle': :modal, 'data-target': '#system_certificate_menu_modal' do
          icon_text 'Certificate', 'fa-certificate'
        end
      end
    end


    def system_certificate_menu_modal
      modal(header: {text: 'Certificate', icon: 'fa-certificate'}, footer_close: true, id: 'system_certificate_menu_modal') do
          back_to_system_control_panel_menu_link +
          system_certificate_upload_link +
          system_certificate_download_link
      end
    end

    def system_key_menu_link
      content_tag :div do
        content_tag :button, title: 'Upload/download key', class: 'btn btn-lg btn_resource', type: 'button', 'data-dismiss': :modal, 'data-toggle': :modal, 'data-target': '#system_key_menu_modal' do
          icon_text 'Key', 'fa-key'
        end
      end
    end


    def system_key_menu_modal
      modal(header: {text: 'Key', icon: 'fa-key'}, footer_close: true, id: 'system_key_menu_modal') do
          back_to_system_control_panel_menu_link +
          system_key_upload_link +
          system_key_download_link
      end
    end





    # def system_domains_menu_link
    #   content_tag :div do
    #     content_tag :button, title: 'Domains menu', class: 'btn btn-lg btn_resource', type: 'button', 'data-dismiss': :modal, 'data-toggle': :modal, 'data-target': '#domains_menu_modal' do
    #       icon_text 'Domains', 'fa-globe'
    #     end
    #   end
    # end
    #
    #
    # def system_domains_menu_modal
    #   modal(header: {text: 'Domains', icon: 'fa-globe'}, footer_close: true, id: 'domains_menu_modal') do
    #     content_tag(:span, 'Domains', class: 'dropdown-header') +
    #     @system.domains.map do |domain|
    #       resource_link(domain)
    #     end.join.html_safe +
    #     system_admin_link
    #   end
    # end

  end
end
