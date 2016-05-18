module Navbar
  module NavbarHelper

    def navbar
      if controller_name == 'portals'
        portal_navbar
      else
        application_navbar
      end
    end

  end
end
