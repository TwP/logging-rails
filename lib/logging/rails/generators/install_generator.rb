module Logging::Rails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      namespace 'logging:install'
      source_root File.expand_path('../templates', __FILE__)

      def generate_config
        template 'logging.rb.erb', 'config/logging.rb'
      end

      def insert_log_to_destinations
        comment = "\n  # Set the logging destination(s)\n  %s\n"
        insert_into_file 'config/environments/development.rb', comment % 'config.log_to = %w[stdout file]', :before => %r/^end\s*$/
        insert_into_file 'config/environments/production.rb', comment % 'config.log_to = %w[file]', :before => %r/^end\s*$/
      end

      def insert_show_log_configuration
        comment = "\n  # Show the logging configuration on STDOUT\n  config.show_log_configuration = %s\n"
        insert_into_file 'config/environments/development.rb', comment % 'true', :before => %r/^end\s*$/
        insert_into_file 'config/environments/production.rb', comment % 'false', :before => %r/^end\s*$/
      end
    end
  end
end
