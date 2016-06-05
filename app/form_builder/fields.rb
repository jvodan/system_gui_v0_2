# module FormBuilder
  module Fields

    # include Normal
    include Elements
    include Image

    # def left_gap; field_opts[:left_gap].to_i; end
    # def width; (field_opts[:width] || 12).to_i; end
    # def right_gap; field_opts[:right_gap].to_i || (12 - @left_gap - @width ); end
    # def placeholder; field_opts[:placeholder].to_s; end
    # def depend_on_target; ( field_opts[:depend_on] || {} )[:target].to_s; end
    # def depend_on_match; ( field_opts[:depend_on] || {} )[:match].to_s; end

    def engines_field(opts={})
      opts[:method_name] = object.method_name
      opts[:label] = object.label == false ? false : ( object.label || name.labelize )
      opts[:as] = object.as || :string
      opts[:title] = object.title == false ? false : ( object.title || object.label )
      opts[:horizontal] = object.horizontal == false ? false : ( object.horizontal || true )
      opts[:compact] = object.compact || false
      opts[:left] = object.left
      opts[:width] = object.width || 10
      opts[:right] = object.right
      opts[:collection] = object.collection || []
      opts[:tooltip] = object.tooltip
      opts[:hint] = object.hint
      opts[:placeholder] = object.placeholder
      opts[:comment] = object.comment
      opts[:validate_regex] = object.validate_regex
      opts[:validate_invalid_message] = object.validate_invalid_message
      opts[:depends_on_field] = object.depends_on_field
      opts[:depends_on_regex] = object.depends_on_regex
      engines_field_builder(:value, opts)
    end

    def engines_field_builder(method, opts={})
      title = opts[:title] || "#{object.to_s} - #{method.to_s.humanize}"
      horizontal = opts[:horizontal] == true
      compact = opts[:compact] == true
      left = opts[:left] || (horizontal ? 2 : 0)
      width = opts[:width] || (horizontal ? 10 : 12)
      right = opts[:right] || 0
      total_width = left + width + right
      errors = object.errors[method]
      depend_on = opts[:depend_on]
      depend_on_data = depend_on ? { behavior: :depend_on, depend_on_input: depend_on[:input], depend_on_value: depend_on[:value], depend_on_property: depend_on[:property], depend_on_display: depend_on[:display] } : {}
      if opts[:as] && opts[:as].to_sym == :hidden
        engines_hidden_field method, opts
      else
        @template.content_tag(:span, data: depend_on_data) do
          if horizontal
            @template.content_tag(:div, class: "col-sm-#{total_width}") do
              @template.content_tag(:div, class: "form-group form_field horizontal_form_field #{'compact_form_field' if compact} #{'has-warning' if errors.any?}") do
                engines_field_builder_label_for(method, {label: opts[:label], class: "col-sm-#{left*12/total_width}"})  +
                @template.content_tag(:div, class: "col-sm-#{width*12/total_width} col-sm-offset-right-#{right*12/total_width}") do
                  engines_field_builder_add_hint_and_errors_to_field(method, opts.without(:label))
                end
              end
            end
          else
            @template.content_tag(:div, class: "col-sm-#{width} col-sm-offset-#{left} col-sm-offset-right-#{right}") do
              @template.content_tag(
                  :div,
                  class: "form-group form_field vertical_form_field #{'compact_form_field' if compact} #{'has-warning' if errors.any?}",
                  title: title) do
                (opts[:label] == false ? ''.html_safe : engines_field_builder_label_for(method, {label: opts[:label]})) +
                engines_field_builder_add_hint_and_errors_to_field(method, opts.without(:label))
              end
            end
          end
        end
      end
    end

    def engines_field_builder_add_hint_and_errors_to_field(method, opts={})
      errors = object.errors[method]
      @template.content_tag(:div, opts[:comment], class: 'help-block engines_field_comment' ) +
      engines_field_builder_selector(method, opts) +
      @template.content_tag(:div, opts[:hint], class: 'help-block engines_field_hint' ) +
      if errors
        @template.content_tag :div, class: 'help-block' do
          errors.map do |error|
            next if error.include? 'Paperclip::Errors::NotIdentifiedByImageMagickError'
            if error.is_a? Array
              error.last
            else
              error
            end
          end.join.html_safe
        end
      end
    end

    def engines_field_builder_selector(method, opts={})
      data_type = opts[:as] || object.class.data_type_for(method)
      case data_type.to_sym
      when :boolean
        engines_checkbox_field method, opts
      when :enum
        engines_enum_field method, opts
      when :parent, :belongs_to
        engines_association_field method, opts
      when :radios
        engines_collection_radios_field method, opts
      when :select
        engines_collection_select_field method, opts
      when :collection
        engines_collection_field method, opts
      when :image
        engines_image_field_group method, opts
      when  :date, :datetime, :decimal, :float, :integer, :string, :text, :time, :color, :password, :email
        engines_basic_field method, basic_field_input_type_for(data_type), opts
      # when :color
        # color_label_field(method, opts)
      when :password_with_confirmation
        engines_password_with_confirmation_field method, opts
      when :read_only
        engines_read_only_field method, opts
      else
        opts[:value] = "Unknown type '#{data_type}' for '#{method}'"
        engines_read_only_field method, opts
      end
    end

    private

    def basic_field_input_type_for(data_type)
      case data_type.to_sym
      when :date;             :date_field
      when :datetime;         :datetime_field
      when :decimal;          :number_field
      when :float;            :number_field
      when :integer;          :number_field
      when :string;           :text_field
      when :text;             :text_area
      when :time;             :time_field
      when :color;            :color_field
      when :password;         :password_field
      when :email;            :email_field
      end
    end

  end
# end
