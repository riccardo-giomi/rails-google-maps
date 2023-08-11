# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Read environment variables from `config/local_env.yml`.
  # Used only in development as an alternative way to set the Google API key.
  # NOTE: the value defined in the file will take precedence over values defined
  # in other ways.
  config.before_configuration do
    env_file = Rails.root.join('config/local_env.yml').to_s
    if File.exist?(env_file)
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end
    end
  end

  # Let RuboCop autocorrect files from generators:
  # https://github.com/rubocop/rubocop-rails#rails-configuration-tip
  config.generators.after_generate do |files|
    puts <<-INFO # rubocop:disable Rails/Output

      Running RuboCop autocorrection.
      Run "rubocop" again, possibly with the "--auto-gen-config" option, to see if it missed something.
    INFO
    parsable_files = files.filter { |file| file.end_with?('.rb', '.jbuilder') }
    system("bundle exec rubocop -A --fail-level=E #{parsable_files.shelljoin} > /dev/null || true", exception: true)
  end

  # This should solve the problem of TailwindCSS `@apply` directives not being
  # (re)built in development. See also:
  # https://github.com/rails/tailwindcss-rails/issues/160
  config.assets.debug = true

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
end
