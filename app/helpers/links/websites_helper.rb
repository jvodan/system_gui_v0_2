module Links
  module WebsitesHelper

    def engines_website_links(engine)
      engine.core_engine.web_sites.map do |web_site|
        content_tag(:p) do
          link_to icon_text(web_site, 'fa fa-globe'), web_site, target: "engine_#{engine.id}", class: 'btn btn-lg'
        end
      end.join.html_safe
    end

  end
end
