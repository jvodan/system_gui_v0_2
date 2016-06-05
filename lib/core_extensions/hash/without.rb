module Viewspec
  module Lib
    module CoreExtensions
      module Hash
        module Without

          def without(*keys)
            dup.without!(*keys)
          end

          def without!(*keys)
            reject! { |key| keys.include?(key) }
          end

        end
      end
    end
  end
end
