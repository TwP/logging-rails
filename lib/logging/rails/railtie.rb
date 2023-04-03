module Logging::Rails

  # The Railtie is used to inject the Logging framework into the Rails
  # application.
  class Railtie < ::Rails::Railtie

    generators do
      require File.expand_path('../generators/install_generator', __FILE__)
    end

    config.before_configuration do
      config.log_to = %w[file]
      config.show_log_configuration = false
    end

    initializer 'logging.configure', :before => 'initialize_logger' do |app|
      file = ::Rails.root.join('config/logging.rb')
      load file if File.exist? file
      ::Logging::Rails.configuration.call(app.config) if ::Logging::Rails.configuration
    end

    initializer 'logging.initialize', :before => 'initialize_logger' do
      ::Rails.logger = ::Logging::Logger[::Rails]
    end

    initializer 'logging.active_record.logger', :before => 'active_record.logger' do
      ActiveSupport.on_load(:active_record) { self.__send__(:include, ::Logging::Rails::Mixin) }
    end

    initializer 'logging.action_controller.logger', :before => 'action_controller.logger' do
      ActiveSupport.on_load(:action_controller) { self.__send__(:include, ::Logging::Rails::Mixin) }
    end

    initializer 'logging.action_view.logger', :before => 'action_view.logger' do
      ActiveSupport.on_load(:action_view) { self.__send__(:include, ::Logging::Rails::Mixin) }
    end

    initializer 'logging.action_mailer.logger', :before => 'action_mailer.logger' do
      ActiveSupport.on_load(:action_mailer) { self.__send__(:include, ::Logging::Rails::Mixin) }
    end

    if ActiveSupport::Dependencies.respond_to? :logger= then
      initializer 'logging.active_support.dependencies.logger' do
        ActiveSupport::Dependencies.logger = ::Logging::Logger[ActiveSupport::Dependencies]
      end
    end

    initializer 'logging.initialize_cache', :after => 'initialize_cache' do
      ::Rails.cache.logger = ::Logging::Logger[::Rails.cache]
    end

    config.after_initialize do |app|
      if app.config.show_log_configuration and (STDIN.tty? or defined?(Rails::Console))
        ::Logging.show_configuration(STDERR)
      end
    end
  end
end
