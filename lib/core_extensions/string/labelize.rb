module Viewspec
  module Lib
    module CoreExtensions
      module String
        module Labelize

          def labelize
            humanize + (' ID' if self.ends_with?('_id')).to_s
          end

        end

      end
    end
  end
end
