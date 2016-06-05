module Installers
  module LinksHelper

    def installer_return_to_library_link(app)
      library = app.repository.library
      url = library ? installers_library_path() : system_path
      query_params = library ? {library_id: library.id} : nil
      title = library ? "Return to #{library.to_s}" : 'Return to system'
      resource_link :library, remote: false, url: url, params: query_params,
      text: false, icon: 'fa-arrow-up ', title: title
    end

  end
end
