# module FormBuilder
  module Fields

    include Normal
    include Checkbox
    include Elements
    include Image

    # def left_gap; field_opts[:left_gap].to_i; end
    # def width; (field_opts[:width] || 12).to_i; end
    # def right_gap; field_opts[:right_gap].to_i || (12 - @left_gap - @width ); end
    # def placeholder; field_opts[:placeholder].to_s; end
    # def depend_on_target; ( field_opts[:depend_on] || {} )[:target].to_s; end
    # def depend_on_match; ( field_opts[:depend_on] || {} )[:match].to_s; end

    def engines_field(method, opts={})
      title = opts[:title] || "#{object.to_s} - #{method.to_s.humanize}"
      horizontal = opts[:horizontal] == true
      left = opts[:left] || (horizontal ? 2 : 0)
      width = opts[:width] || (horizontal ? 10 : 12)
      right = opts[:right] || 0
      errors = object.errors[method]
      label_html =
      if horizontal
        @template.content_tag(:span, class: '') do
          @template.content_tag(:div, class: 'form-group') do
            engines_field_label_for(method, {label: opts[:label], class: "aa col-sm-#{left}"})  +
            @template.content_tag(:div, class: "dd col-sm-#{width}") do
              engines_field_with_errors(method, opts)
            end +
            @template.content_tag(:div, '&nbsp;'.html_safe, class: "ee col-sm-#{right}")
          end
        end
      else
        @template.content_tag(:div, class: "bb col-sm-#{width} col-sm-offset-#{left} col-sm-offset-right-#{right}") do
          @template.content_tag(
              :div,
              class: "form-group #{'has-warning' if errors.any?}".strip,
              title: title) do
            engines_field_label_for(method, {label: opts[:label]}) +
            engines_field_with_errors(method, opts)
          end
        end
      end
    end

    def engines_field_with_errors(method, opts={})
      errors = object.errors[method]
      engines_field_selector(method, opts) +
      if errors
        @template.content_tag :div do
          errors.map do |error|
              next if error.include? 'Paperclip::Errors::NotIdentifiedByImageMagickError'
              @template.content_tag(:span, class: 'help-block') do
              error.to_s
            end
          end.join.html_safe
        end
      end
    end

    def engines_field_selector(method, opts={})
      data_type = opts[:as] || object.class.data_type_for(method)
      case data_type
      when :boolean
        checkbox_label_field(method, opts)
      when :enum
        enum_label_field(method, opts)
      when :parent
        parent_label_field(method, opts)
      # when :collection_radios
      #   collection_radios_field
      # when :collection_select
      #   collection_select_field
      when :belongs_to
        belongs_to_label_field(method, opts)
      when :image
        engines_image_field_group(method, opts)
      when  :date, :datetime, :decimal, :float, :integer, :string, :text, :time, :color, :password
        engines_basic_field(method, basic_field_input_type_for(data_type), opts)
      # when :color
        # color_label_field(method, opts)
      else
        "<p>Unknown data type '#{data_type}' for form field '#{method}'.<p>".html_safe
      end
    end

    private

    def basic_field_input_type_for(data_type)
      case data_type
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
      end
    end

  end
# end
