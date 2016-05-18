module Systems
  module LinksHelper

    def return_to_system_link
      resource_link :system, remote: false,
      text: false, icon: 'fa-arrow-up', title: 'Return to system'
    end

    def system_install_link
      resource_link :installer,
      text: 'Install', icon: 'fa-plus', remote: false, title: 'Install new engine'
    end

    def system_activity_link
      resource_link :system_activity,
      text: 'Activity', icon: 'fa-bar-chart', remote: false, title: 'Monitor system'
    end

    def system_display_link
      edit_resource_link :system_display,
      text: 'Display', icon: 'fa-tv', title: 'Configure display settings'
    end

    # def system_admin_link
    #   resource_link :system_admin,
    #   text: 'Admin', icon: 'fa-user', title: 'Configure admin user'
    # end

    def system_certificate_upload_link
      resource_link :system_certificate_upload,
      text: 'Upload', icon: 'fa-upload', title: 'Upload certificate'
    end

    def system_certificate_download_link
      resource_link :system_certificate_download,
      text: 'Download', icon: 'fa-download', title: 'Download certificate'
    end

    def system_bugs_link
      resource_link :system_bug_reports,
      text: 'Bugs', icon: 'fa-bug', title: 'Bug report settings'
    end

    def system_report_link
      resource_link :system_report,
      text: 'Report', icon: 'fa-list-alt', title: 'System report'
    end

    def system_services_link
      resource_link :services,
      text: 'Services', icon: 'fa-compass', remote: false, title: 'Services'
    end

    def system_domains_link
      resource_link :system_domains,
      text: 'Domains', icon: 'fa-globe', remote: false, title: 'Domains'
    end

    def system_libraries_link
      resource_link :system_libraries,
      text: 'Libraries', icon: 'fa-th', remote: false, title: 'Libraries'
    end

    def system_users_link
      resource_link :system_users,
      text: 'Users', icon: 'fa-users', remote: false, title: 'User profiles'
    end

    def system_registry_link
      resource_link :system_registry,
      text: 'Registry', icon: 'fa-arrows', remote: false, title: 'User profiles'
    end

    def system_key_upload_link
      resource_link :system_key_upload,
      text: 'Upload', icon: 'fa-upload', title: 'Upload machine key'
    end

    def system_key_download_link
      resource_link :system_key_download,
      text: 'Download', icon: 'fa-download', title: 'Download machine key'
    end

    def system_logs_link
      resource_link :system_logs,
      text: 'Logs', icon: 'fa-file-text-o', title: 'View system logs'
    end

    def system_registry_link
      resource_link :system_registry,
      text: 'Registry', icon: 'fa-arrows', title: 'Manage system registry'
    end

    def system_reboot_link
      destroy_resource_link :system_reboot,
      text: 'Reboot', icon: 'fa-power-off', title: 'Reboot machine',
      method: :get,
      confirm: {text: 'Are you sure that you want to reboot this machine?',
                title: {text: 'Confirm reboot'} }
    end

    def system_update_engines_link
      resource_link :system_update_engines,
      text: 'Update', title: 'Update Engines', icon: 'fa-refresh'
    end

    def system_update_base_os_link
      resource_link :system_update_base_os,
      text: 'Update', title: 'Update Base OS', icon: 'fa-refresh'
    end


  end
end
