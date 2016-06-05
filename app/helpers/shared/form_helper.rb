module Shared
  module FormHelper

    def form_for(object, opts={}, &block)
      ( super object,
        (opts.without :remote).merge({ builder: EnginesFormBuilder,
              remote: (opts[:remote].nil? ? (request.format.to_sym == :js) : opts[:remote]),
              html: (opts.without :remote).merge({ class: "opts[:class] form-horizontal" }) }),
            &add_errors(&block) )
    end

    def add_errors(&block)
      Proc.new { |f| f.errors + capture{yield(f)} }
    end

  end
end
