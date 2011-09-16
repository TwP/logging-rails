
require 'logging'
include Logging.globally

module Logging::Rails

  # :stopdoc:
  LIBPATH = ::File.expand_path('../..', __FILE__) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  # :startdoc:

  class << self
    # Returns the version string for the library.
    #
    def version
      @version ||= File.read(path('version.txt')).strip
    end

    # Stores the given Logging configuration block for later evalution by the
    # Railtie. This method is used in the 'config/logging.rb' configuration
    # file.
    #
    def configure( &block )
      @configuration = block
    end

    attr_reader :configuration

    # Returns the path for Mr Bones. If any arguments are given,
    # they will be joined to the end of the path using <tt>File.join</tt>.
    #
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
    #
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

end  # Logging::Rails

