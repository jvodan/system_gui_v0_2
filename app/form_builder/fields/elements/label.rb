module Fields
  module Elements
    module Label

      def engines_field_builder_label_for(method, opts={})
        label_text = opts[:label] || method.to_s.humanize unless opts[:label] == false
        @template.content_tag :label, label_text,
              # for: engines_field_builder_id_for(method),
              class: [ 'control-label', opts[:class] ].join(' ')
      end

    end
  end
end
