module Domains
  module LinksHelper

    def edit_system_domain_link(domain)
      edit_resource_link domain,
      url: edit_system_domain_path(systems_domain: { domain_name: domain.domain_name }),
      form_class: 'display_inline',
      text: 'Edit', icon: 'fa-edit', title: "Edit #{domain.domain_name}"
    end

    def delete_system_domain_link(domain)
      destroy_resource_link domain,
      url: system_domain_path(systems_domain: { domain_name: domain.domain_name }),
      form_class: 'display_inline pull_right_wide_media',
      text: 'Delete', icon: 'fa-trash', title: "Delete #{domain.domain_name}",
      confirm: {text: "Are you sure that you want to Delete #{domain.domain_name}?",
                title: {text: 'Confirm delete'} }
    end

    def new_system_domain_link
      new_resource_link :system_domain, text: 'New'
    end

  end
end
