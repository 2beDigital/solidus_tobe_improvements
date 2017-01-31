module SolidusTobeImprovements
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
         append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/solidus_tobe_improvements\n"
      end

      def add_stylesheets
        append_file 'vendor/assets/stylesheets/spree/frontend/all.css', "*= require spree/frontend/solidus_tobe_improvements\n"
      end

      def add_images
         append_file 'config/initializers/assets.rb', "\nRails.application.config.assets.precompile += %w( flags/* )\n"
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=solidus_tobe_improvements'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end