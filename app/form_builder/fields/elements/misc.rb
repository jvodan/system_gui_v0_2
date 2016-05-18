module Fields
  module Elements
    module Misc

      def engines_hidden_field(method)
        hidden_field(method)
      end
      
      def engines_readonly_field(method, opts={})
        text_field(
          method,
          value: object.viewspec_parent_object.to_label,
          readonly: 'readonly',
          class: 'form-control' )
      end

    end
  end
end
