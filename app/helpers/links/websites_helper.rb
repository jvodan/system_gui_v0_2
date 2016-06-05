module Links
  module WebsitesHelper

    def app_website_links(app)
      app.websites.map do |web_site|
        content_tag(:p) do
          link_to icon_text(web_site, 'fa fa-globe'), web_site, title: "Website for #{app.name}", target: "app_#{app.id}", class: 'btn btn-lg'
        end
      end.join.html_safe
    end

  end
end
