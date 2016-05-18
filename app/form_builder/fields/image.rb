module Fields
  module Image

    def engines_image_field_group(method, opts)
      if object.send(method).present? && object.errors[method].empty?
        engines_field_label_for(method, {label: opts[:label], class: 'col-sm-2'}) +
        @template.content_tag(:div, class: 'col-sm-2') do
          @template.image_tag(object.icon.url(:medium))
        end +
        @template.content_tag(:div, class: 'col-sm-8') do
          engines_basic_field(method, :file_field) +
          engines_checkbox_field_group(:icon_clear, label: 'Delete')
        end
      else
        engines_field_label_for(method, {label: opts[:label], class: 'col-sm-2'}) +
        @template.content_tag(:div, class: 'col-sm-10') do
          engines_basic_field(method, :file_field)
        end
      end
    end

  end
end
