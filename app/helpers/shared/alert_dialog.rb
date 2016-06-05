module Shared
  module AlertDialogHelper

    def alert_dialog(body=nil, opts={})
      opts.merge!{opts[:footer_close] == false, opts[:footer_ok] == true}
      modal(body, opts)
    end

  end
end
