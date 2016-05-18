module Page
  module AdminBannerHelper

    def admin_banner
      content_tag :h1,
        class: 'admin_banner container-fluid row text-center',
        style: admin_banner_style do
          @system.admin_banner
      end if current_user && current_user.is_admin? && @system.admin_banner.present?
    end

    def admin_banner_style
      portal_page_body_style
    end

  end
end
