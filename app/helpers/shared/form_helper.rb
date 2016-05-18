module Shared
  module FormHelper

    def form_for(object, opts={}, &block)
      ( super object,
            { builder: EnginesFormBuilder,
              html: { id: opts[:id], class: 'form-horizontal' } }.
                merge(opts),
            &add_errors(&block) )
    end

    def add_errors(&block)
      Proc.new { |f| f.errors + capture{yield(f)} }
    end

  end
end
