
module Logging::Rails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      namespace 'logging:install'
      source_root File.expand_path('../templates', __FILE__)

      def generate_config
        template 'logging.rb.erb', 'config/logging.rb'
      end
    end
  end
end

