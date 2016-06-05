module Fields
  module Elements
    module Select

      def engines_collection_field(method, opts={})
        opts[:collection] = opts[:collection] || []
        if opts[:collection].count > 5
          engines_collection_select_field(method, opts)
        else
          engines_collection_radios_field(method, opts)
        end
      end

      def engines_collection_select_field(method, opts={})
        collection_select(
          method,
          opts[:collection],
          :first, :last, {selected: opts[:value]}, { class: "form-control #{opts[:class]}" } )
      end

      def engines_collection_radios_field(method, opts={})
        @template.content_tag :div, class: "radios_collection #{opts[:class]}" do
          collection_radio_buttons(
            method,
            opts[:collection], :first, :last, {checked: opts[:value]}, {} ) do |radio_button|
                @template.content_tag :div, class: 'radio' do
                  radio_button.label { radio_button.radio_button +
                                        radio_button.text }
                end
              end
        end
      end

    end
  end
end
