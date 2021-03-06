module EnginesSystemCore
  class CoreMachine

    include Versions
    include CoreApi::ApiCall

    def initialize(ip, secret)
      @ip = ip
      @secret = secret
    end

    def api
      @api ||= (p :LOAD_MACHINE; 10.times{p '$'}; EnginesSystemCore.api)
    end

  end
end
