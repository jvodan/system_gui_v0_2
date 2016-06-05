module Shared
  module TextHelper

    def icon_text(text, icon=nil, opts={})
      content_tag :span, title: opts[:title] do
        if icon.present?
          icon(icon) +
          content_tag(
            :span,
            ( "&nbsp;#{text}".html_safe if text ) )
        else
          text.to_s
        end.gsub('"', "'").html_safe
      end
    end

    def icon_url_text(text, icon_url=nil, opts={})
      content_tag :span, title: opts[:title] do
        if icon_url.present?
          image_tag(icon_url) +
          content_tag(
            :span,
            ( "&nbsp;#{text}".html_safe if text ) )
        else
          text.to_s
        end.gsub('"', "'").html_safe
      end
    end


    def icon(icon)
      if icon.is_a? String
        single_icon(icon)
      else
        stacked_fa_icon(icon)
      end
    end

    def single_icon(icon)
      content_tag(:i, nil, class: "#{icon.to_s.split('-', 2).first} #{icon}")
    end

    def stacked_fa_icon(icon)
      content_tag :span, style: 'font-size: 0.5em;', class: 'fa-stack' do
        content_tag(:i, nil, class: "fa #{icon.first} fa-stack-2x fa-sm") +
        content_tag(:i, nil, class: "fa #{icon.last} fa-sm fa-stack-1x fa-inverse")
      end
    end

    def markdown_text(text)
      Markdown.new(
        text,
        :hard_wrap, :filter_html, :autolink,
        :no_intra_emphasis, :fenced_code_blocks ).
        to_html.html_safe
    end

    def pretty_print(data)
      content_tag :pre do
        if data.is_a?(Array) || data.is_a?(Hash)
          JSON.pretty_generate(data)
        else
          data
        end
      end
    end

    def time_ago(time)
      distance_of_time_in_words(time, DateTime.now) + ' ago'
    end

    def format_time(time)
      time = DateTime.parse(time) if time.is_a? String
      time.strftime "UTC %H:%M:%S %d %B %Y"
    end

    def labelled_pretty_text(label, text)
      content_tag(:label, label) +
      pretty_print(text)
    end

    def boolean_text(boolean)
      if boolean == true
        icon_text('True', 'fa-check')
      else
        icon_text('False', 'fa-times')
      end
    end


  end
end
