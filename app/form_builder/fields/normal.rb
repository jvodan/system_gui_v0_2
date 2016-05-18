module Fields
  module Normal

    # include Elements

    # def engines_basic_field(method, type=nil, opts={})
    #   engines_basic_field(method, type, opts)
    # end

    # def vs_parent_field_group(method, opts={})
    #   vs_field_label(method, opts) +
    #   if object.viewspec_parent_object && object.class.viewspec_parent_immutable?
    #     vs_readonly_field("#{method}_id", opts) +
    #     vs_hidden_field("#{method}_id")
    #   else
    #     collection =  opts[:collection] ||
    #                   object.class.default_association_collection_for(method)
    #     vs_collection_field "#{method}_id", collection
    #   end.html_safe
    # end
    #
    # def vs_belongs_to_field(method, opts={})
    #   collection =  opts[:collection] ||
    #                 object.class.default_association_collection_for(method)
    #   vs_field_label(method, opts) +
    #   vs_collection_field("#{method}_id", collection)
    # end
    #
    # # def vs_parent_field_group(method, opts={})
    # #   collection = opts[:collection] || object.default_association_collection_for(method)
    # #   template.content_tag :div, class: 'form-group' do
    # #     if object.viewspec_parent_object && object.class.viewspec_parent_immutable?
    # #       vs_field_label(method, opts) +
    # #       text_field(
    # #         :viewspec_readonly_parent_name, #Dummy field name for dummy field
    # #         value: object.viewspec_parent_object.to_label,
    # #         readonly: 'readonly',
    # #         class: 'form-control' )
    # #     else
    # #       vs_collection_field(method, collection, opts)
    # #     end
    # #   end
    # # end
    #
    # def vs_enum_field_group(method, opts={})
    #   collection = opts[:collection] || object.class.default_enum_collection_for(method)
    #   vs_field_label(method, opts) +
    #   vs_collection_field(method, collection, opts)
    # end
    #
    #

  end
end
