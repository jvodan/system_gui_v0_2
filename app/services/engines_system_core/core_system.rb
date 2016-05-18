module EnginesSystemCore
  class CoreSystem

    include Loaders
    include Properties
    include CoreResult::ApiCalls

    # def system_api
    #   @@api ||= (p :LOAD_API; 10.times{p '$'}; EnginesOSapi.new)
    # end

  end
end
