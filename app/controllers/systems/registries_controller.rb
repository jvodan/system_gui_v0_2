module Systems
  class RegistriesController < ApplicationController

    def show
      @registry = Systems::Registry.new
    end

  end
end
