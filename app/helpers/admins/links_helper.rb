module Admins
  module LinksHelper

    def edit_system_admin_password_link
      edit_resource_link :system_admin_password,
      text: 'Password', icon: 'fa-lock', title: 'Change admin user password'
    end

    def edit_system_admin_email_link
      edit_resource_link :system_admin_email,
      text: 'Email', icon: 'fa-envelope', title: 'Change admin user email address'
    end

  end
end
