module Fields
  module Elements
    module Label

      def engines_field_label_for(method, opts={})
        @template.content_tag :label, (opts[:label] || method.to_s.humanize),
              for: engines_field_id_for(method),
              class: [ 'control-label', opts[:class] ].join(' ')
      end

    end
  end
end
