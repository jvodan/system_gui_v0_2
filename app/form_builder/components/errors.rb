module Components
  module Errors

    def engines_errors
      if object.errors.any?
        @template.content_tag(:div, class: "col-sm-12") do
          @template.content_tag(:div, class: "form-group") do
            @template.content_tag :div, class: 'alert alert-warning' do
              @template.content_tag(:ul) do
                object.errors.messages.map do |attribute, messages|
                  messages.map do |message|
                    next if message.include? 'Paperclip::Errors::NotIdentifiedByImageMagickError'
                    @template.content_tag :li do
                      if message.is_a? Array
                        message
                      else
                        [ object.class.human_attribute_name(attribute), message ]
                      end.join(' ')
                    end
                  end.join.html_safe
                end.join.html_safe
              end
            end
          end
        end
      else
        ''.html_safe
      end
    end
    alias errors engines_errors

  end
end
