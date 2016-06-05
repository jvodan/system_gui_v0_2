module Libraries
  module LinksHelper

    def edit_system_library_link(library)
      edit_resource_link library,
      url: edit_system_library_path(library),
      form_class: 'display_inline',
      text: 'Edit', icon: 'fa-edit', title: "Edit #{library.name}"
    end

    def delete_system_library_link(library)
      destroy_resource_link library,
      url: system_library_path(library),
      form_class: 'display_inline pull_right_wide_media',
      text: 'Delete', icon: 'fa-trash', title: "Delete #{library.name}",
      confirm: {text: "Are you sure that you want to Delete #{library.name}?",
                title: {text: 'Confirm delete'} }
    end

    def new_system_library_link
      new_resource_link :system_library, text: 'New'
    end

  end
end
