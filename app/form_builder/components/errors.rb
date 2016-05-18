module Components
  module Errors

    def engines_errors
      if object.errors.any?
        @template.content_tag :div, class: 'alert alert-warning' do
          @template.content_tag(:ul) do
            object.errors.full_messages.map do |message|
              next if message.include? 'Paperclip::Errors::NotIdentifiedByImageMagickError'
              @template.content_tag :li do
                message
              end
            end.join.html_safe
          end
        end
      else
        ''.html_safe
      end
    end
    alias errors engines_errors

  end
end
