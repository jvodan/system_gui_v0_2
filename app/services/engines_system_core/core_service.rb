module EnginesSystemCore
  class CoreService

    include Actions
    # include Definitions
    include Inspections
    include Properties
    include CoreApi::ApiCall

    def initialize(name)
      @name = name
    end
    attr_reader :name

  end
end
