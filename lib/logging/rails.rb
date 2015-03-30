require 'logging'
require 'rails' if !defined? Rails or Rails.version

if Rails.version < '3'
  abort("The Logging Railtie only works with Rails 3 or higher - you are running Rails #{Rails.version}")
end

module Logging::Rails

  # :stopdoc:
  LIBPATH = ::File.expand_path('../..', __FILE__) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  # :startdoc:

  class << self
    # Returns the version string for the library.
    def version
      @version ||= File.read(path('version.txt')).strip
    end

    # Stores the given Logging configuration block for later evalution by the
    # Railtie. This method is used in the 'config/logging.rb' configuration
    # file.
    def configure( &block )
      @configuration = block
    end

    attr_reader :configuration

    # Returns the path for Mr Bones. If any arguments are given,
    # they will be joined to the end of the path using <tt>File.join</tt>.
    def path( *args )
      rv = args.empty? ? PATH : ::File.join(PATH, args.flatten)
      if block_given?
        begin
          $LOAD_PATH.unshift PATH
          rv = yield
        ensure
          $LOAD_PATH.shift
        end
      end
      return rv
    end

    # Returns the lib path for Mr Bones. If any arguments are given,
    # they will be joined to the end of the path using <tt>File.join</tt>.
    def libpath( *args )
      rv =  args.empty? ? LIBPATH : ::File.join(LIBPATH, args.flatten)
      if block_given?
        begin
          $LOAD_PATH.unshift LIBPATH
          rv = yield
        ensure
          $LOAD_PATH.shift
        end
      end
      return rv
    end
  end

  libpath {
    require 'logging/rails/railtie'
    require 'logging/rails/mixin'
  }
end

# Here we need to remove the Rails LogTailer from the list of middlewares. The
# Logging framework is fully capable of sending log events to multiple logging
# destinations.
module Rails
  class Server < ::Rack::Server
    def middleware_without_log_tailer
      middlewares = middleware_with_log_tailer['anything']
      middlewares.delete_if { |middleware| Rails::Rack::LogTailer == middleware.first }
      Hash.new(middlewares)
    end
    alias :middleware_with_log_tailer :middleware
    alias :middleware :middleware_without_log_tailer
  end
end
