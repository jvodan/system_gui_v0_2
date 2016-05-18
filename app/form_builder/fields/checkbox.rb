module Fields
  module Checkbox

    def engines_checkbox_field_group(method, opts={})
      @template.content_tag :div, class: 'checkbox' do
        @template.content_tag :label, for: engines_field_id_for(method) do
          engines_basic_field(method, :check_box) +
          ( opts[:label] || method.to_s.humanize )
        end
      end
    end

  end
end
