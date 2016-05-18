module Shared
  module LegendHelper

    def legend(text, opts={})
      icon = opts[:icon]
      subtext = opts[:subtext]
      title = opts[:title] || text
      content_tag :legend, ( icon_text(text, icon) + content_tag(:small, subtext) ), title: title
    end

  end
end
