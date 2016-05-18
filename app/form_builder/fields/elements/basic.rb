module Fields
  module Elements
    module Basic

      def engines_basic_field(method, type=nil, opts={})
        type = type || :text_field
        opts[:id] = opts[:id] || engines_field_id_for(method)
        opts = { class: 'form-control' }.merge(opts) unless type == :check_box
        send type, method, opts
      end

    end
  end
end
