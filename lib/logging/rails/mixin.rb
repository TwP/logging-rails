
module Logging::Rails

  module ControllerMixin
    def self.included( base )
      base.extend self
    end

    def logger
      @_logger ||= ::Logging::Logger[self]
    end
  end

end

