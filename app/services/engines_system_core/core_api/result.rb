module EnginesSystemCore
  module CoreApi
    class Result

      def initialize(action, result, default=nil)
        @action = action.to_sym
        @result = result
        @default = default
      end

      def call
        @action == :act ? call_act : call_get
      end

      def call_act
        if @result.was_success
          {type: :success, message: @result.result_mesg}
        else
          log_error
          { type: :error, message: @result.result_mesg }
        end
      end

      def call_get
        return @result
        #  unless @result.is_a? EnginesOSapiResult
        # log_error
        # @default
      end

      def log_error
        p "PUT ME IN A LOG - ERROR: #{@result.result_mesg}"
      end

    end
  end
end
