module Machines
  module MenusHelper

    # def machine_menu
    #   content_tag :div, class: 'machine_menu' do
    #     machine_menu_button + machine_menu_modal
    #   end
    # end
    #
    # def machine_menu_button
    #   content_tag :button, title: 'Machine menu', class: 'btn btn-lg btn-link', type: 'button', 'data-toggle': 'modal', 'data-target': '#machine_menu_modal' do
    #     icon 'fa-bars'
    #   end
    # end
    #
    # def machine_menu_modal
    #   modal(header: {text: "Machine menu", icon: 'fa-bars'}, footer_close: true, id: "machine_menu_modal") do
    #       machine_access_key_link +
    #       machine_certificate_link +
    #       machine_bugs_link +
    #       machine_logs_link +
    #       machine_registry_link +
    #       machine_reboot_link +
    #       content_tag(:hr) +
    #       content_tag(:span, 'Domains', class: 'dropdown-header') +
    #       @domains.map do |domain|
    #         resource_link(domain)
    #       end.join.html_safe +
    #       content_tag(:hr) +
    #       content_tag(:span, 'Libraries', class: 'dropdown-header') +
    #       @libraries.map do |library|
    #         resource_link(library)
    #       end.join.html_safe +
    #       content_tag(:hr) +
    #       content_tag(:span, "Engines (#{EnginesMachine::Machine.engines_version})", class: 'dropdown-header') +
    #       machine_update_engines_link +
    #       content_tag(:hr) +
    #       content_tag(:span, "#{EnginesMachine::Machine.base_machine_name} (#{EnginesMachine::Machine.base_machine_os_version})", class: 'dropdown-header') +
    #       machine_update_base_os_link
    #   end
    # end

  end
end
