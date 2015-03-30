module Logging::Rails

  # Include this module into your ApplicationController to provide
  # per-controller log level configurability. You can also include this module
  # into your models or anywhere else you would like to control the log level.
  #
  # Alternatively, you can use the `include Logging.globally` trick to add a
  # `logger` method to every Object in the ruby interpreter. See
  # https://github.com/TwP/logging/blob/master/lib/logging.rb#L194 for more
  # details.
  module Mixin

    LOGGER_METHOD = RUBY_VERSION < '1.9' ? 'logger' : :logger

    # This method is called when the module is included into a class. It will
    # extend the including class so it also has a class-level `logger` method.
    def self.included( other )
      other.__send__(:remove_method, LOGGER_METHOD.to_sym) if other.instance_methods.include? LOGGER_METHOD
      other.extend self
    end

    # This method is called when the modules is extended into another class or
    # module. It will remove any existing `logger` method and insert its own
    # version.
    def self.extended( other )
      eigenclass = class << other; self; end
      eigenclass.__send__(:remove_method, LOGGER_METHOD.to_sym) if eigenclass.instance_methods.include? LOGGER_METHOD
    end

    # Returns the logger instance.
    def logger
      @logger ||= ::Logging::Logger[self]
    end
  end
end
